# OrderItem(id: integer, price: decimal, quantity: integer, order_id: integer, variant_id: integer, created_at: datetime, updated_at: datetime)
FactoryBot.define do
  factory :order_item do
  	price {100.0}
    quantity {1}
    order_id {1}
    variant_id {1}
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end