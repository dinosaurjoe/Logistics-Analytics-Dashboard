class Shop < ApplicationRecord
  belongs_to :user
  has_many :shipments, dependent: :destroy
  has_many :customers
  has_one :freight_capacity

end
