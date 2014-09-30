require 'rails_helper'

describe 'reviewing' do
  before do
    Restaurant.create(name: 'KFC')
  end

  it 'allows users to leave reviews using the form which appears alonside restaurants' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "average"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content "average"
  end

  
end