FactoryBot.define do
  factory :cart do
    user_id { 1 }
    created_at { DateTime.now }
    updated_at { DateTime.now }

    
  end
end
