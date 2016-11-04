# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  users = User.create!(
    username: Faker::Superhero.name,
    email:Faker::Internet.free_email,
    password: "123"
  )
end
50.times do
  post = Post.create!(
  body: FFaker::CheesyLingo.sentence,
  user_id: (1..50).to_a.sample
  )
end