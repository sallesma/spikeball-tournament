require_relative '../../../spec_helper'

describe Admin::Controllers::Tournaments::Destroy do
  let(:action) { Admin::Controllers::Tournaments::Destroy.new }
  let(:params) { Hash[id: 1] }
  let(:repository) { TournamentRepository.new }

  before do
    @tournament = repository.create(id: 1, name: 'Coupe', date: Date.today)
  end

  after do
    repository.clear
  end

  it 'is a redirection to tournament list' do
    response = action.call(params)

    response[0].must_equal 302
    response[1]['Location'].must_equal '/admin/tournaments'
  end

  it 'deletes the tournament' do
    action.call(params)
    assert_nil repository.find(1)
  end
end
