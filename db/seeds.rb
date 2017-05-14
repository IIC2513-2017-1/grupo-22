# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Team.destroy_all
Tourney.destroy_all
Foro.destroy_all

5.times do
  User.create(full_name: Faker::Name.name, username: Faker::Internet.user_name,
  email: Faker::Internet.email, password: Faker::Internet.password)
end

User.create(full_name: "11100111", username: "ROBerto",
email: "bibubop@uc.com", password: "123")

3.times do
  Team.create(name: Faker::Team.name, description: 'Description',
  logo: 'logo.png', trainer: Faker::Name.name, foundation_date: Faker::Date.backward(30), user_id: User.first.id)
end

Tourney.create(name: "Test", description: 'Description', format: 'Torneo',
location: Faker::Address.street_address,
inscription_limit_date: Faker::Date.between(25.days.ago, 20.days.ago),
start_date: Faker::Date.between(20.days.ago, 15.days.ago), end_date: Faker::Date.backward(7),
user_id: User.find_by(username: "ROBerto").id,
mail: Faker::Internet.email, price: '0', prize: 'Happiness (?)',phone: '7777777-0',
schedule: Faker::Time.between(DateTime.now - 1, DateTime.now))


Foro.create({:title => "Foro de Test", :description => "Descripcion del foro de Test", :tourney_id => Tourney.first.id})
