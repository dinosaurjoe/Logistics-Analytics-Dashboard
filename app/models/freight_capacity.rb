class FreightCapacity < ApplicationRecord
  belongs_to :shipment

  TRANSPORTATION_TYPE = ["Air Freight", "Ocean Freight", "Rail Freight"]
  CONTAINER_SIZE = ["LCL (Less-than Container Load)", "20' Container", "40' Container", "45' High Cube"]

  def value
    @freight_capacity = self

    @freight_capacity.service_value = (@freight_capacity.volume * 1181.04)

  end
end
