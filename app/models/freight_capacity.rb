class FreightCapacity < ApplicationRecord
  belongs_to :shop
  belongs_to :shipment
end
