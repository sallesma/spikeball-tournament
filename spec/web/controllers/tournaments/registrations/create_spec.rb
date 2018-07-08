require_relative '../../../../spec_helper'

describe Web::Controllers::Tournaments::Registrations::Create do
  let(:action) { Web::Controllers::Tournaments::Registrations::Create.new }
  let(:repository) { RegistrationRepository.new }
  let(:tournament_repository) { TournamentRepository.new }
  let(:player_repository) { PlayerRepository.new }

  before do
    @tournament = tournament_repository.create(name: 'Coupe', date: Date.today)
  end

  after do
    repository.clear
    tournament_repository.clear
    player_repository.clear
  end

  describe 'with valid params' do
    let(:params) do
      {
        tournament_id: @tournament.id,
        registration:
        {
          player: {
            first_name: 'George',
            last_name: 'Abitbol',
            email: 'george@spikeball.com'
          }
        }
      }
    end

    it 'creates a new registration' do
      action.call(params)
      registration = repository.last

      registration.id.wont_be_nil
      assert_same player_repository.last.id, registration.player_id
      assert_same @tournament.id, registration.tournament_id
    end

    it 'redirects the user to the tournament page' do
      response = action.call(params)

      response[0].must_equal 302
      response[1]['Location'].must_equal "/tournaments/#{@tournament.id}"
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[registration: {}] }


    it 'returns HTTP client error' do
      response = action.call(params)
      response[0].must_equal 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      errors.dig(:tournament_id).must_equal  ['is missing']
      errors.dig(:registration, :player).must_equal  ['is missing']
    end
  end
end
