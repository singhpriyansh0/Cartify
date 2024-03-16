class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :variant
  # def self.ransackable_attributes(auth_object = nil)
  #   ["created_at", "id", "order_id", "price", "quantity", "updated_at", "variant_id"]
  # end

end
