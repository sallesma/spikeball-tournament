require_relative '../../../spec_helper'

describe Admin::Controllers::Players::Destroy do
  let(:action) { Admin::Controllers::Players::Destroy.new }
  let(:params) { Hash[id: 1] }
  let(:repository) { PlayerRepository.new }

  before do
    @player = repository.create(id: 1, first_name: 'George', last_name: 'Abitbol', email:'george@spikeball.com')
  end

  after do
    repository.clear
  end

  it 'is a redirection to player list' do
    response = action.call(params)

    response[0].must_equal 302
    response[1]['Location'].must_equal '/admin/players'
  end

  it 'deletes the player' do
    action.call(params)
    assert_nil repository.find(1)
  end
end
