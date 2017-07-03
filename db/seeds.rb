# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Eliminemos todo lo que había antes
User.destroy_all
Team.destroy_all
Tourney.destroy_all
Match.destroy_all
Foro.destroy_all
Player.destroy_all

#Faker::Internet.password(6)
5.times do
  User.create(full_name: Faker::Name.name, username: Faker::Internet.user_name,
  email: Faker::Internet.email, password: "123123")
end

12.times do
  Team.create(name: Faker::Team.name, description: 'Description', trainer: Faker::Name.name,
  foundation_date: Faker::Date.between(7.years.ago, 2.years.ago), user_id: User.all.pluck(:id).sample)
end

40.times do
  Player.create(full_name: Faker::Name.name,
  position: ['Arquero', 'Central', 'Lateral', 'Mediocampista', 'Delantero'].sample,
  address: Faker::Address.street_address,
  phone: Faker::PhoneNumber.cell_phone,
  email: Faker::Internet.email,
  ocupation: Faker::Job.title,
  leg: ['Izquierdo', 'Derecho'].sample,
  birth_date: Faker::Date.between(40.years.ago, 20.years.ago),
  team_id: Team.all.pluck(:id).sample)
end
