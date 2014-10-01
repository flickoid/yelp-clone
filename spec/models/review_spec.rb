require 'rails_helper'

describe Review, :type => :model do

  it "is valid with a rating between 1-5" do
    review = Review.new(rating: 4)
    expect(review).to be_valid
  end

  it "is not valid with a rating greater than 5" do
    review = Review.new(rating: 10)
    expect(review).not_to be_valid
  end

  it "is not valid with a rating less than 1" do
    review = Review.new(rating: -5)
    expect(review).not_to be_valid
  end
end
