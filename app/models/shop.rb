class Shop < ApplicationRecord
  belongs_to :user
  has_many :shipments, dependent: :destroy
end
