# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all
Review.destroy_all

burger_off = Restaurant.create(:name => "Burger Off")
burger_off.reviews.create(thoughts: "bad", rating: 1)
burger_off.reviews.create(thoughts: "ok", rating: 2)
burger_off.reviews.create(thoughts: "so so", rating: 3)
burger_off.reviews.create(thoughts: "good", rating: 4)
burger_off.reviews.create(thoughts: "fantastic", rating: 5)

ufc = Restaurant.create(:name => "Unlucky Fried Kitten")
ufc.reviews.create(thoughts: "really bad", rating: 1)
ufc.reviews.create(thoughts: "really ok", rating: 2)
ufc.reviews.create(thoughts: "really so so", rating: 3)
ufc.reviews.create(thoughts: "really good", rating: 4)
ufc.reviews.create(thoughts: "really fantastic", rating: 5)