class FreightCapacity < ApplicationRecord
  belongs_to :shop
  belongs_to :shipment

  TRANSPORTATION_TYPE = ["Air Freight", "Ocean Freight", "Rail Freight"]
  CONTAINER_SIZE = ["LCL (Less-than Container Load)", "20' Container", "40' Container", "45' High Cube"]
end
