FactoryBot.define do
  factory :address do

    address_line_1 {"mg road ah-0"}
    address_line_2 {"ring road "}
    house_room_number {"vg-000"}
    landmark {"MG squar"}
    pin_code {"000000"}
    default_address {true} 
    city_id { 1 }
    user_id { 1 }


  end
    # association :city,factory: :city
end
