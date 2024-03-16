FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    phone_number {"8770187805"}
    email {"content.bucket667@gmail.com"}
    password {"password"}

    
  end
end





  #<User id: 7, email: "content.bucket6@gmail.com", created_at: "2023-10-20 09:08:11.881948000 +0000", updated_at: "2023-10-23 12:19:20.685734000 +0000", first_name: "Admin", last_name: "5", phone_number: "8770187805">
