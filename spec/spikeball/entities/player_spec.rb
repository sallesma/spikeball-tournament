require_relative '../../spec_helper'

describe Player do
  it 'can be initialized with attributes' do
    player = Player.new(first_name: 'George', last_name: 'Abitbol')
    player.first_name.must_equal 'George'
    player.last_name.must_equal 'Abitbol'
  end
end
