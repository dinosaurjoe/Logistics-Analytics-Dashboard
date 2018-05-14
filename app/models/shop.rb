class Shop < ApplicationRecord
  belongs_to :user
  has_many :shipments, dependent: :destroy
  has_many :customers
  has_many :freight_capacities

end
