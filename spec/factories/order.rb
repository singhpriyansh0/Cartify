# Order(id: integer, status: string, address_id: integer, created_at: datetime, updated_at: datetime, user_id: integer) 
FactoryBot.define do
  factory :order do
  	status {"pending"}
    address_id {1}
    user_id {1}
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end