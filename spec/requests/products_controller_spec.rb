require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  before(:each) do
    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category)
    @product = FactoryBot.create(:product,category_id: @category.id)
    @cart = FactoryBot.create(:cart, user_id: @user.id)
    @variant = FactoryBot.create(:variant , product_id: @product.id)
    @cart_item = FactoryBot.create(:cart_item , cart_id: @cart.id , variant_id:@variant.id)
    @token =  JsonWebToken.encode(email: @user.email)
    
      


    end




  # describe "sign_in user"do 
  #   it "sign_in"do 
  #     post:create , params {email:@user.email, password:@user.password}
  #     expect(response.status).to eq 200

  # end
  # end


  describe "Get/index"do 
    it "render products" do
      get:index , params:{token: @token}
      expect(response.status).to eq 200
    end
  end

  describe "Get/show" do 
    it "render product"do  
    binding.pry         
      get:show , params: {id: @product.id , variant: @variant ,user:@user, token: @token} 
      expect(response.status).to eq 200    
    end
  end

  
end