# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require "yaml"
# require "open-uri"

Customer.destroy_all

password = Faker::Internet.password(8)
OCCUPATION = ["Logistics Manager", "Supplier", "Logistics Assistant", "Sales"]
GENDER = ["men", "women"]
NUMBER = (0..99)

5.times do
  c = Customer.new(
    shop: Shop.first,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    # occupation: "#{OCCUPATION.sample}"
    )
  # u.remote_profile_picture_url = "https://randomuser.me/api/portraits/#{GENDER.sample}/#{rand(NUMBER)}.jpg"
  c.save!

end
