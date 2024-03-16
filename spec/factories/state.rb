FactoryBot.define do
  factory :state do
    name { "Sample State" } # Default city name
        # Default state_id, change as needed
    created_at { DateTime.now }
    updated_at { DateTime.now }
    country_id {1}
  end

 

end