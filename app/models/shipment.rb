class Shipment < ApplicationRecord
  belongs_to :shop
  validates :status, :destination, :origin, :freight_capacity, :service_value, presence: true

end
