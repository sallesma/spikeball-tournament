require_relative '../../../spec_helper'

describe Admin::Controllers::Tournaments::Create do
  let(:action) { Admin::Controllers::Tournaments::Create.new }
  let(:repository) { TournamentRepository.new }

  after do
    repository.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[tournament: { name: 'Coupe', date: Date.today }] }

    it 'creates a new tournament' do
      action.call(params)
      tournament = repository.last

      tournament.id.wont_be_nil
      tournament.name.must_equal params.dig(:tournament, :name)
    end

    it 'redirects the user to the tournaments listing' do
      response = action.call(params)

      response[0].must_equal 302
      response[1]['Location'].must_equal '/admin/tournaments'
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[tournament: {}] }


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
