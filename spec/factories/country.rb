FactoryBot.define do
  factory :country do
    name { "Sample Country" } # Default city name        
    created_at { DateTime.now }
    updated_at { DateTime.now }
    # association :state, factory: :state
  end

end