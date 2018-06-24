require 'features_helper'

describe 'List players' do
  it 'displays each player on the page' do
    visit '/admin/players'

    within '#players' do
      assert page.has_css?('.player', count: 2), 'Expected to find 2 players'
    end
  end
end
