require_relative '../../../spec_helper'

describe Admin::Controllers::Tournaments::Index do
  let(:action) { Admin::Controllers::Tournaments::Index.new }
  let(:params) { Hash[] }
  let(:repository) { TournamentRepository.new }

  before do
    @tournament = repository.create(name: 'Coupe', date: Date.today)
  end

  after do
    repository.clear
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all tournaments' do
    action.call(params)
    action.exposures[:tournaments].must_equal [@tournament]
  end
end
