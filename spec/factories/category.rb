FactoryBot.define do
  factory :category do

    name {"Sample_name"}
    created_at { DateTime.now }
    updated_at { DateTime.now }
    
  end
    # association :city,factory: :city
end