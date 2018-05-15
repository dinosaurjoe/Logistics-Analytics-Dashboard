class Shipment < ApplicationRecord
  belongs_to :shop
  validates :status, presence: true
  has_one :freight_capacity, as: :shippable
  has_one :location, as: :locatable
  has_one :destination, as: :destinable

end
