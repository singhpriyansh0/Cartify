FactoryBot.define do
  factory :product do
    name {"product_name"}
    description {"sample_description"}
    brand_name {"sample_brand_name"}
    category_id { 1 }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
    # association :city,factory: :city
end