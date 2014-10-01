require 'rails_helper'

describe 'reviewing' do
  before do
    Restaurant.create(name: 'KFC')
  end

  def leave_review(thoughts, rating)
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

  it 'allows users to leave reviews using the form which appears alonside restaurants' do
    leave_review("average", "3")
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content "average"
  end

  it 'displays an average rating for all reviews' do
    leave_review("so so", "3")
    leave_review("great", "5")
    expect(page).to have_content("Average rating: 4")
  end
end
