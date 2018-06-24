require_relative '../../../spec_helper'

describe Admin::Controllers::Tournaments::Update do
  let(:action) { Admin::Controllers::Tournaments::Update.new }
  let(:id) { 1 }
  let(:params) { Hash[id: id, tournament: tournament_params] }
  let(:repository) { TournamentRepository.new }

  before do
    @tournament = repository.create(id: id, name: 'Coupe', date: Date.today)
  end

  after do
    repository.clear
  end

  describe 'with valid params' do
    let(:tournament_params) { { name: 'Competition', date: Date.today + 1 } }

    it 'creates a new tournament' do
      action.call(params)
      tournament = repository.find(id)

      tournament.name.must_equal tournament_params[:name]
      tournament.date.must_equal tournament_params[:date]
    end

    it 'redirects the user to the tournament show' do
      response = action.call(params)

      response[0].must_equal 302
      response[1]['Location'].must_equal '/admin/tournaments/1'
    end
  end

  describe 'with invalid params' do
    let(:tournament_params) { {} }


    it 'returns HTTP client error' do
      response = action.call(params)
      response[0].must_equal 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      errors.dig(:tournament, :name).must_equal  ['is missing']
      errors.dig(:tournament, :date).must_equal  ['is missing']
    end
  end
end
