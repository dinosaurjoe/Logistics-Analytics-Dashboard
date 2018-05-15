class Destination < ApplicationRecord
  belongs_to :destinable, polymorphic: true


  # geocoded_by :address

  # after_validation :geocode, :if => :address_changed?
end
