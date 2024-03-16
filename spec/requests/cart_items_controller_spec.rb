require "rails_helper"

RSpec.describe CartItemsController , type: :controller do 
	
		before (:each) do 
		@user = FactoryBot.create(:user)
		@country = FactoryBot.create(:country)
	    @state = FactoryBot.create(:state, country_id: @country.id)
	    @city = FactoryBot.create(:city,state_id: @state.id)
	    @address = FactoryBot.create(:address, city_id: @city.id, user_id: @user.id)
	    @order = FactoryBot.create(:order, address_id: @address.id, user_id: @user.id)
		@cart = FactoryBot.create(:cart, user_id: @user.id)
	    @category = FactoryBot.create(:category)
	    @product = FactoryBot.create(:product, category_id: @category.id)
	    @variant = FactoryBot.create(:variant , product_id: @product.id)
	    @cart_item = FactoryBot.create(:cart_item , cart_id: @cart.id , variant_id:@variant.id)
		@token = JsonWebToken.encode(email: @user.email)
    	@req_params =  request.headers.merge!("token" => "#{@token}")

	end

	describe "Get/index"do 
	it "show cart Item" do 
		get:index 	
		expect(response.status).to eq 200
	end
	end

	describe "Post/create" do
	
	
		it "for if condition " do 			
			post :create , params: {cart_item: { variant_id: @variant.id , quantity: @cart_item.quantity }}			
			expect(response.status).to eq 200
		end

		it "for else condition" do 
			post :create, params: {cart_item: { variant_id: 2 , quantity:2 }}
			expect(response.status).to eq 200
		end
	end

	describe "Put/update" do 
		
		it "for if condition : increase quantity" do 
			put:update , params:{id: @cart_item.id , decrease: { test: "test"}}
			expect(response.status).to eq 200
		end

		


	end

end


