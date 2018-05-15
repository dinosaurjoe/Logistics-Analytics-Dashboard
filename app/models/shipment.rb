class Shipment < ApplicationRecord
  belongs_to :shop
  validates :status, :destination, :origin, presence: true
  has_one :freight_capacity, as: :shippable
  has_many :locations, as: :locatable
end
