require_relative '../../../spec_helper'

describe Admin::Controllers::Players::Create do
  let(:action) { Admin::Controllers::Players::Create.new }
  let(:params) { Hash[player: {first_name: 'George', last_name: 'Abitbol', email: 'george@spikeball.com'}] }
  let(:repository) { PlayerRepository.new }

  before do
    repository.clear
  end

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
