class Shipment < ApplicationRecord
  belongs_to :shop
  validates :status, :destination, :origin, :service_value, presence: true

end
