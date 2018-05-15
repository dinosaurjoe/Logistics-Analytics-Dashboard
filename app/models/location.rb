class Location < ApplicationRecord
  belongs_to :locatable, polymorphic: true


  # geocoded_by :address

  # after_validation :geocode, :if => :address_changed?
end
