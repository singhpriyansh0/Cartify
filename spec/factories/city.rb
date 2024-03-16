FactoryBot.define do
  factory :city do
    name { "Sample City" } # Default city name        # Default state_id, change as needed
    created_at { DateTime.now }
    updated_at { DateTime.now }
    state_id {1}

    # association :state, factory: :state
  end
end