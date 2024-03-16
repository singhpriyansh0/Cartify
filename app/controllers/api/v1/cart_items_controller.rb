class Api::V1::CartItemsController < ApplicationController
 

	def index
		current_user = User.find(params[:id])
		@cart = current_user.cart #since has_one association
		@cart_items =@cart.cart_items
		render json: @cart_items , status: 200 
		
	end 


	def create
		current_user = User.find(params[:id])
		@cart = current_user.cart

			
			if @item =CartItem.find_by(variant_id: form_params[:variant_id])
				@item.update(quantity: (@item.quantity + 1))
				render json: @cart , status: 200

			else 
				@cart_item = @cart.cart_items.new(form_params)
				@cart_item.save
				render json: @cart , status: 200
			end
		
	end 

	def update 

		@cartitem = CartItem.find(params[:id])

		if params[:decrease]
			@cartitem.update(quantity: (@cartitem.quantity - 1))
			 

		elsif params[:increase]
			@cartitem.update(quantity: (@cartitem.quantity + 1))
			
	
		
		elsif params[:save_for_later] 
			@cartitem.update(save_for_later: true)
			
		
		elsif params[:move_to_cart]
			@cartitem.update(save_for_later: false)
			
			

		elsif params[:remove_from_list]
			@cartitem.destroy
			
	

		elsif params[:proceed_to_checkout]
			redirect_to  default_address_address_path
		end 

		render json: @cartitem , status: 200
	
	end

	
	private
    def form_params
    	params.require(:cart_item).permit(:variant_id , :quantity)
    end
end
