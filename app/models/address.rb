class Address < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :orders
  validates :pin_code, presence: true , length: {maximum: 6}  

end
