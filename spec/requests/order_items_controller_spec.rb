require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
	before(:each) do
	@user = FactoryBot.create(:user)
	@country = FactoryBot.create(:country)
    @state = FactoryBot.create(:state, country_id: @country.id)
    @city = FactoryBot.create(:city,state_id: @state.id)
    @address = FactoryBot.create(:address, city_id: @city.id, user_id: @user.id)
    @order = FactoryBot.create(:order, address_id: @address.id, user_id: @user.id)
    @category = FactoryBot.create(:category)
    @product = FactoryBot.create(:product, category_id: @category.id)
    @variant = FactoryBot.create(:variant , product_id: @product.id)
	@order_item = FactoryBot.create(:order_item , variant_id: @variant.id, order_id: @order.id)
	

    
	@token =  JsonWebToken.encode(email: @user.email) 

	end

	describe "Get/index" do 
		it "show all orders" do 
			get:index , params: {token:@token}
			expect(response.status).to eq 200
		end
	end

	describe "Get/show" do 
		let (:order_item_params) do
		{ "id" => @order_item.id , "token" => @token}
	end
		
		it "display ordered item" do
			get:show , params:order_item_params
			expect(response.status).to eq 200
		end
	end
end