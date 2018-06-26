require_relative '../../../../spec_helper'

describe Web::Controllers::Tournaments::Registrations::New do
  let(:action) { Web::Controllers::Tournaments::Registrations::New.new }
  let(:params) { Hash[tournament_id: 1] }
  let(:repository) { TournamentRepository.new }

  before do
    @tournament = repository.create(id: 1, name: 'Coupe', date: Date.today)
  end

  after do
    repository.clear
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes the tournament' do
    action.call(params)
    action.exposures[:tournament].must_equal @tournament
  end
end
