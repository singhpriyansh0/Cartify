require "rails_helper"

# def authenticated_header(request, user)
#      		token = JsonWebToken.encode({email:user.email})
#      		request.headers.merge!('token': "#{token}")
# end
# 			authenticated_header(request , @user)


RSpec.describe HomeController, type: :controller do 
before(:each) do 
	@user = FactoryBot.create(:user)
	@category = FactoryBot.create(:category)
    @product = FactoryBot.create(:product, category_id: @category.id)
    @token = JsonWebToken.encode(email: @user.email)
    @req_params =  request.headers.merge!("token" => "#{@token}")

    

end

	describe "Get/index" do
		it "show products and category " do
			get:index , params:@req_params
			expect(response.status).to eq 200
		end
	end
	

	describe "Get/show " do 
		it "show all product" do 
			binding.pry
		get:show , params: @req_params.merge!( id: @category.id)
		binding.pry
		expect(response.status).to eq 200
		end

	end 


end
