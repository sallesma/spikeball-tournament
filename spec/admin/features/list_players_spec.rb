require 'features_helper'

describe 'List players' do
  let(:repository) { PlayerRepository.new }
  before do
    repository.clear

    repository.create(first_name: 'George', last_name: 'Abitbol', email: 'george@spikeball.com')
    repository.create(first_name: 'Noel', last_name: 'Flantier', email: 'noel@spikeball.com')
  end

  it 'displays each player on the page' do
    visit '/admin/players'

    within '#players' do
      assert page.has_css?('.player', count: 2), 'Expected to find 2 players'
    end
  end
end
