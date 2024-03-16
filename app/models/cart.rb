class Cart < ApplicationRecord
  # belongs_to :variant
  belongs_to :user
  has_many :cart_items
  # belongs_to :address
end
