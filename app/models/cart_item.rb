class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :variant
  #   def self.ransackable_attributes(auth_object = nil)
  #   ["cart_id", "created_at", "id", "quantity", "save_for_later", "updated_at", "variant_id"]
  # end

end
