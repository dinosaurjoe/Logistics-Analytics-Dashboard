# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require "yaml"
# require "open-uri"
User.destroy_all
Shop.destroy_all
Customer.destroy_all
Request.destroy_all
FreightCapacity.destroy_all
Shipment.destroy_all
Location.destroy_all
Destination.destroy_all

password = Faker::Internet.password(8)
OCCUPATION = ["Logistics Manager", "Supplier", "Logistics Assistant", "Sales"]
GENDER = ["men", "women"]
NUMBER = (0..99)
VOLUME = (1..43)
REQUEST_PROPOSAL = (1200..8000)
REQUEST_BOOLEAN = [true, false]
SHIPMENT_STATUS = ["Received", "Open", "Completed"]
SHIPMENT_ORIGIN = ["Mexico City", "Paris", "Chicago", "Tokyo"]
SHIPMENT_DESTINATION = [ "Singapore", "New York", "Hong Kong", "London"]
TRANSPORTATION_TYPE = ["Air Freight", "Ocean Freight", "Rail Freight"]
CONTAINER_SIZE = ["LCL (Less-than Container Load)", "20' Container", "40' Container", "45' High Cube"]

john = User.new(
  email: "email@gmail.com",
  password: "password",
  first_name: "John",
  last_name: "Cargo",
  occupation: "Logistics Manager",
  )

john.save!

shop1 = Shop.new(
  user_id: john.id,
  name: "John's Shop"
    )
shop1.save!

5.times do
  c = Customer.new(
    shop: User.first.shops.first,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    occupation: "#{OCCUPATION.sample}",
    images: "https://randomuser.me/api/portraits/#{GENDER.sample}/#{rand(NUMBER)}.jpg"

    )
  c.update_attribute :created_at, (rand*10).days.ago
  c.update_attribute :updated_at, (rand*5).days.ago
  c.save!

end

10.times do
  r = Request.new(
    user_id: User.first.id,
    customer_id: Customer.all.sample.id,
    user_confirmation: REQUEST_BOOLEAN.sample,
    customer_confirmation: REQUEST_BOOLEAN.sample,
    proposal: rand(REQUEST_PROPOSAL)
    )

  r.save!
  #u.remote_profile_picture_url = "https://randomuser.me/api/portraits/#{GENDER.sample}/#{rand(NUMBER)}.jpg"

end

requests = Request.all

requests.each do |request|
  fr = FreightCapacity.new(
        shippable_id: request.id,
        shippable_type: "Request",
        transportation_type: TRANSPORTATION_TYPE.sample,
        container_size: CONTAINER_SIZE.sample,
        volume: rand(VOLUME),
      )
  fr.save
  end


20.times do
  s = Shipment.new(
    shop_id: User.first.shops.first.id,
    status: SHIPMENT_STATUS.sample,
    )

  s.save
end

shipments = Shipment.all

shipments.each do |shipment|
        f = FreightCapacity.new(
        shippable_id: shipment.id,
        shippable_type: "Shipment",
        transportation_type: TRANSPORTATION_TYPE.sample,
        container_size: CONTAINER_SIZE.sample,
        volume: rand(VOLUME)
      )

    f.save

      l = Location.new(
        locatable_id: shipment.id,
        locatable_type: "Shipment",
        address: SHIPMENT_ORIGIN.sample
        )

      l.save

      d = Destination.new(
        destinable_id: shipment.id,
        destinable_type: "Shipment",
        address: SHIPMENT_DESTINATION.sample
        )

      d.save

  end




