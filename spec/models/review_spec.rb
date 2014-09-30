require 'rails_helper'

RSpec.describe Review, :type => :model do

  it "is not valid with a rating outside of the range 1-5" do
    review = Review.new(rating: 10)
    expect(review).not_to be_valid
  end
end
