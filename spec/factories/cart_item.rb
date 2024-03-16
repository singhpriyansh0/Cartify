FactoryBot.define do
  factory :cart_item do
    quantity { 1 }
    save_for_later  { false }
    cart_id {1}
    variant_id {1}
    created_at { DateTime.now }
    updated_at { DateTime.now }

    
  end
end
