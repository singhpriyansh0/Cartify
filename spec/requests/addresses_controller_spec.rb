require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    @country = FactoryBot.create(:country)
    @state = FactoryBot.create(:state, country_id: @country.id)
    @city = FactoryBot.create(:city,state_id: @state.id)
    @address = FactoryBot.create(:address, city_id: @city.id, user_id: @user.id)
    # @address = FactoryBot.create(:address)
    @req_params = { user_id: @user.id}
    @show_params = {user_id: @user.id, id: @address.id}
    # @address_params = {user_id: @user.id,
    # city_id: @city.id,
    # pin_code: 000000,
    # landmark: "fdsds",
    # address_line_1: "ff",
    # address_line_2: "f",
    # house_room_number: "g"}
  end

  describe "GET/ Index" do

   it "render index page" do
      get:index , params: @req_params
      expect(response.status).to eq 200
    end
    end


    describe "GET/SHOW"do 
    it "render show page "do
    get:show , params: @show_params
    expect(response.status).to eq 200
    end
    end

    describe  "Put/update"do
      let(:update_params) do { 
    id: @address.id,
    user_id: @user.id,
    def_address: @address.default_address
  } end

    let (:select_for_delivery_params) do {
      user_id: @user.id ,
      id: @address.id ,
      select_for_delivery: true
    }end

    let (:delete_address_params) do{
      id: @address.id,
      remove_address: true,
      user_id: @user.id
    }end
      it "Update address"do 
      binding.pry
      put :update , params: update_params.merge(@req_params)
      expect(response.status).to eq 200
    end


    it "select_for_delivery" do 
      put :update , params: select_for_delivery_params
      expect(response.status).to eq 200
    end

    it "delete address" do
      put :update , params: delete_address_params
      binding.pry
      expect(response.status).to eq 200
    end
  end

  describe "post/create"do 
  let (:create_user_params) do
    {"address" => {"address_line_1"=>"fd", "address_line_2"=>"kj", "house_room_number"=>"jkj",
     "landmark"=>"kjn", "pin_code"=>"kjnj", "city_id"=> @city.id}, "user_id" => @user.id}
  end

  it "address created " do 
    binding.pry
    post :create , params: create_user_params
    expect(response.status).to eq 201
  end


  
  end



  end


