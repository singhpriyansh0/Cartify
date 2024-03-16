FactoryBot.define do
  factory :variant do
    colour { 'sample_colour' }
    weight  { 10.5 }
    product_id {1}
    price {100.0}
    created_at { DateTime.now }
    updated_at { DateTime.now }

    
  end
end

