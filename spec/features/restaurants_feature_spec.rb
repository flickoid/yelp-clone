require 'rails_helper'

describe 'restaurants' do

  context 'no restaurants have been added' do
    it 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add A Restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'KFC')
    end

    it 'should display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
    end
  end
end

describe 'creating restaurants' do

  it 'prompts the user to fill out a form then displays the new restaurant' do
    visit '/restaurants'
    click_link 'Add A Restaurant'
    fill_in 'Name', with: 'KFC'
    click_button 'Create Restaurant'
    expect(page).to have_content('KFC')
    expect(current_path).to eq '/restaurants'
  end
end

describe 'editing restaurants' do
  before do
    Restaurant.create(name: 'KFC')
  end

  it 'can allow a user to edit a restaurant' do
    visit '/restaurants'
    click_link 'Edit KFC'
    fill_in 'Name', with: 'Kentucky Fried Chicken'
    click_button 'Update Restaurant'
    expect(page).to have_content 'Kentucky Fried Chicken'
    expect(current_path).to eq '/restaurants'
  end
end

describe 'deleting restaurants' do
  before do
    Restaurant.create(name: 'KFC')
  end

  it 'removes the restaurant when user clicks delete link' do
    visit '/restaurants'
    click_link 'Delete KFC'
    expect(page).not_to have_content 'KFC'
    expect(page).to have_content "Restaurant successfully deleted"
  end
end
























