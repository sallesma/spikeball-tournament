require_relative '../../../spec_helper'

describe Admin::Controllers::Players::Update do
  let(:action) { Admin::Controllers::Players::Update.new }
  let(:id) { 1 }
  let(:params) { Hash[id: id, player: player_params] }
  let(:repository) { PlayerRepository.new }

  before do
    @player = repository.create(id: id, first_name: 'George', last_name: 'Abitbol', email:'george@spikeball.com')
  end

  after do
    repository.clear
  end

  describe 'with valid params' do
    let(:player_params) { {first_name: 'Noel', last_name: 'Flantier', email: 'noel@spikeball.com'} }

    it 'creates a new player' do
      action.call(params)
      player = repository.find(id)

      player.first_name.must_equal player_params[:first_name]
      player.last_name.must_equal player_params[:last_name]
      player.email.must_equal player_params[:email]
    end

    it 'redirects the user to the player show' do
      response = action.call(params)

      response[0].must_equal 302
      response[1]['Location'].must_equal '/admin/players/1'
    end
  end

  describe 'with invalid params' do
    let(:player_params) { {} }


    it 'returns HTTP client error' do
      response = action.call(params)
      response[0].must_equal 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      errors.dig(:player, :first_name).must_equal  ['is missing']
      errors.dig(:player, :last_name).must_equal  ['is missing']
      errors.dig(:player, :email).must_equal  ['is missing']
    end
  end
end
