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
Request.destroy_all
# Shipment.destroy_all

password = Faker::Internet.password(8)
OCCUPATION = ["Logistics Manager", "Supplier", "Logistics Assistant", "Sales"]
GENDER = ["men", "women"]
NUMBER = (0..99)
REQUEST_PROPOSAL = (1200..8000)
REQUEST_BOOLEAN = [true, false]
SHIPMENT_STATUS = ["Received", "Open", "Completed"]
SHIPMENT_ORIGIN = ["Shanghai", "Singapore", "Shenzen", "Ningbo-Zhoushan", "Hong Kong", "Busan",
                   "Qingdao", "Guangzhou Harbor", "Jebel Ali", "Tianjin", "Rotterdam", "Port Klang"]
SHIPMENT_DESTINATION = ["Kaohsiung", "Antwerp", "Dalian", "Xiamen", "Tanjung Pelepas", "Hamburg", "Los Angeles",
                        "Keihin Ports", "Long Beach", "Laem Chabang", "New York", "Bremen"]
TRANSPORTATION_TYPE = ["Air Freight", "Ocean Freight", "Rail Freight"]
CONTAINER_SIZE = ["LCL (Less-than Container Load)", "20' Container", "40' Container", "45' High Cube"]


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

10.times do
  f = FreightCapacity.new(
    shop_id: User.first.shops.first.id,
    shipment_id: User.first.shops.first.shipments.sample.id,
    transportation_type: TRANSPORTATION_TYPE.sample,
    container_size: CONTAINER_SIZE.sample,
    volume: rand(NUMBER)
    )

  f.save
end
# 10.times do
#   s = Shipment.new(
#     shop_id: User.first.shops.first.id,
#     status: SHIPMENT_STATUS.sample,
#     origin: SHIPMENT_ORIGIN.sample,
#     destination: SHIPMENT_DESTINATION.sample



#     )

#   s.save
# end
