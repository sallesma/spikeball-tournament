require_relative '../../spec_helper'

describe Tournament do
  it 'can be initialized with attributes' do
    tournament = Tournament.new(name: 'George', date: Date.today)
    tournament.name.must_equal 'George'
    tournament.date.must_equal Date.today
  end
end
