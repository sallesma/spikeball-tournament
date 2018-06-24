require_relative '../../../spec_helper'

describe Admin::Controllers::Players::Create do
  let(:action) { Admin::Controllers::Players::Create.new }
  let(:repository) { PlayerRepository.new }

  before do
    repository.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[player: {first_name: 'George', last_name: 'Abitbol', email: 'george@spikeball.com'}] }

    it 'creates a new player' do
      action.call(params)
      player = repository.last

      player.id.wont_be_nil
      player.first_name.must_equal params.dig(:player, :first_name)
    end

    it 'redirects the user to the players listing' do
      response = action.call(params)

      response[0].must_equal 302
      response[1]['Location'].must_equal '/admin/players'
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[player: {}] }


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
