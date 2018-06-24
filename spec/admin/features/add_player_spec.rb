require 'features_helper'

describe 'Add a player' do
  after do
    PlayerRepository.new.clear
  end

  it 'can create a new player' do
    visit '/admin/players/new'

    within 'form#player-form' do
      fill_in 'First name',  with: 'George'
      fill_in 'Last name', with: 'Abitbol'
      fill_in 'Email', with: 'george@spikeball.com'

      click_button 'Create'
    end

    current_path.must_equal('/admin/players')
    assert page.has_content?('George')
  end
end
