class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :shop, optional: true
  has_many :requests, dependent: :destroy
  accepts_nested_attributes_for :shop

  # validates :shop_id, presence: true


  protected

    def confirmation_required?
      false
    end
end
