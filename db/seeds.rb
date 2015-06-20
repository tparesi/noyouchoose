# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(uid: "blahblah1", provider: "facebook", name: "Tommy Duek")
User.create!(uid: "blahblah2", provider: "facebook", name: "Constance Jiang")
User.create!(uid: "blahblah3", provider: "facebook", name: "Jonathan Tamboer")
User.create!(uid: "blahblah4", provider: "facebook", name: "Sennacy D. Cat")

Friendship.create!(user_id: 1, friend_id: 2)
Friendship.create!(user_id: 1, friend_id: 3)
Friendship.create!(user_id: 1, friend_id: 4)
Friendship.create!(user_id: 2, friend_id: 3)
Friendship.create!(user_id: 2, friend_id: 4)
Friendship.create!(user_id: 3, friend_id: 4)
