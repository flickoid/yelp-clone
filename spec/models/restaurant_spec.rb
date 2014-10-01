require 'rails_helper'

describe Restaurant, :type => :model do

  it "is valid with a name of more than 3 characters" do
    restaurant = Restaurant.new(name: "Domino's")
    expect(restaurant).to be_valid
  end

  it "is not valid with a name of less than 3 characters" do
    restaurant = Restaurant.new(name: "al")
    expect(restaurant).not_to be_valid
    expect(restaurant).to have(1).error_on(:name)
  end

  it "is not valid unless it has a unique name" do
    Restaurant.create(name: "The Ivy")
    restaurant = Restaurant.new(name: "The Ivy")
    expect(restaurant).to have(1).error_on(:name)
  end

  describe '#average_rating' do

    context 'no reviews' do

      it 'returns "N/A"' do
        restaurant = Restaurant.create(name: 'KFC')
        expect(restaurant.average_rating).to eq "N/A"
      end
    end

    context '1 review' do

      it 'returns that rating' do
        restaurant = Restaurant.create(name: 'KFC')
        restaurant.reviews.create(rating: 4)
        expect(restaurant.average_rating).to eq(4)
      end
    end

    context 'multiple reviews' do

      it 'returns the average' do
        restaurant = Restaurant.create(name: 'KFC')
        restaurant.reviews.create(rating: 3)
        restaurant.reviews.create(rating: 5)
        expect(restaurant.average_rating).to eq(4)
      end
    end
  end
end