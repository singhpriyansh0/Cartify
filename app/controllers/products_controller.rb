class ProductsController < ApplicationController
	# include Separable
	before_action :authenticate
	def index
		@products = Product.all 
		@category = Category.all
		# SendEmailsJob.new(current_user).perform(wait: 10.seconds)
		# SendEmailsJob.set(wait: 15.seconds).perform_later(current_user)

		# SendEmailsJob.perform_later(current_user)    working normal job 
		# HardJob.perform_at(10.seconds.from_now, current_user.to_json) ------------------ working 
		
		
	end

	def new 
	end
	
	def show 
		
		binding.pry
		@product= Product.find(params[:id])
		@variants = @product.variants
			
		@cart = @current_user.cart
		@cart_item =CartItem.new
	end 
    
  

end
