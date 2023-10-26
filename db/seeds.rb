# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'faker'
Faker::Config.locale = 'fr'

User.destroy_all
Gossip.destroy_all
Tag.destroy_all
City.destroy_all


10.times do |index|
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip
   )
end

10.times do |index|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 5),
    email: Faker::Internet.email,
    age: Faker::Number.within(range: 18..65),
    city: City.all.sample
  )
end

20.times do |index|
  Gossip.create!(
    title: Faker::Book.title,
    content: Faker::Quote.matz,
    user: User.all.sample
  )
end

10.times do |index|
  Tag.create!(
    title: Faker::Book.genre 
  )
end

Gossip.all.each do |gossip|
  2.times do |index|
    GossipTag.create!(
      gossip: gossip,
      tag: Tag.all.sample
    )
  end
end