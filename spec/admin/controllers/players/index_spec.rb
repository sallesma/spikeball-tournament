require_relative '../../../spec_helper'

describe Admin::Controllers::Players::Index do
  let(:action) { Admin::Controllers::Players::Index.new }
  let(:params) { Hash[] }
  let(:repository) { PlayerRepository.new }

  before do
    @player = repository.create(first_name: 'George', last_name: 'Abitbol', email:'george@spikeball.com')
  end

  after do
    repository.clear
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all players' do
    action.call(params)
    action.exposures[:players].must_equal [@player]
  end
end
