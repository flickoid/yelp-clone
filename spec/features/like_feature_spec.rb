require 'rails_helper'

describe 'likes' do

  before do
    kfc = Restaurant.create(name: "KFC")
    kfc.reviews.create(thoughts: "ok", rating: 3)
  end

  it 'can like a review updating the like count', js: true do
    visit '/restaurants'
    click_link 'Like this review'
    expect(page).to have_content '1 like'
  end
end
