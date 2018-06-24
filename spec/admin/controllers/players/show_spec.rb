require_relative '../../../spec_helper'

describe Admin::Controllers::Players::Show do
  let(:action) { Admin::Controllers::Players::Show.new }
  let(:params) { Hash[id: 1] }
  let(:repository) { PlayerRepository.new }

  before do
    repository.clear

    @player = repository.create(id: 1, first_name: 'George', last_name: 'Abitbol', email:'george@spikeball.com')
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes the player' do
    action.call(params)
    action.exposures[:player].must_equal @player
  end
end
