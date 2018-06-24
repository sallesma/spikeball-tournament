require 'features_helper'

describe 'Update a player' do
  before :all do
    PlayerRepository.new.create(id: 1, first_name: 'George', last_name: 'Abitbol', email: 'george@spikeball.com')
  end

  after :all do
    PlayerRepository.new.clear
  end

  it 'can update a player' do
    visit '/admin/players/1/edit'

    within 'form#player-form' do
      fill_in 'First name',  with: 'Noel'
      fill_in 'Last name', with: 'Flantier'
      fill_in 'Email', with: 'noel@spikeball.com'

      click_button 'Update'
    end

    current_path.must_equal('/admin/players/1')
    assert page.has_content?('Noel')
    assert page.has_content?('Flantier')
    assert page.has_content?('noel@spikeball.com')
  end

  it 'displays list of errors when params contains errors' do
    visit '/admin/players/1/edit'

    within 'form#player-form' do
      fill_in 'First name',  with: ''
      click_button 'Update'
    end

    current_path.must_equal('/admin/players/1')

    assert page.has_content?('There was a problem with your submission')
    assert page.has_content?('First Name must be filled')
  end
end
