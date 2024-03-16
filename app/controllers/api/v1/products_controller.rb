class Api::V1::ProductsController < ApplicationController
	# include Auth

  # def login
  #   auth_object = Auth::Authentication.new(login_params)
  #   if auth_object.authenticate
  #     render json: {
  #       message: "Login successful!", token: auth_object.generate_token }, status: :ok
  #   else
  #     render json: {
  #       message: "Incorrect username/password combination"}, status: :unauthorized
  #   end
  # end
  




	def index

		
		@products = Product.all 
		@category = Category.all
		# SendEmailsJob.new(current_user).perform(wait: 10.seconds)
		# SendEmailsJob.set(wait: 15.seconds).perform_later(current_user)

		# SendEmailsJob.perform_later(current_user)    working normal job 
		HardJob.perform_at(10.seconds.from_now, current_user.to_json)
		
		render json: { product: @products , category: @category} , status:201 
		
	end

	def new 
	end
	
	def show 
		current_user = User.find(params[:user_id])
		@product= Product.find(params[:id])
		@variants = @product.variants
		binding
		@cart = current_user.cart
		@cart_item =CartItem.new

		render json: { product: @product , variants: @variants, cart: @cart, cart_item: @cart_item } , status: 200
	end 


	private
  def login_params
    params.require(:user).permit(:email, :password)
  end

end
