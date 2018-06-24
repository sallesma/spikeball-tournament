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

  it 'displays list of errors when params contains errors' do
    visit '/admin/players/new'

    within 'form#player-form' do
      click_button 'Create'
    end

    current_path.must_equal('/admin/players')

    assert page.has_content?('There was a problem with your submission')
    assert page.has_content?('First Name must be filled')
    assert page.has_content?('Last Name must be filled')
    assert page.has_content?('Email must be filled')
  end
end
