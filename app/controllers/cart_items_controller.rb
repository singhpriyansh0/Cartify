class CartItemsController < ApplicationController
 

	def index
	
		@cart = current_user.cart #since has_one association
		@cart_items =@cart.cart_items
		
	end 


	def create
		
		@cart = @current_user.cart
			
			if @item =CartItem.find_by(variant_id: form_params[:variant_id])
				@item.update(quantity: (@item.quantity + 1))


			else 
				@cart_item = @cart.cart_items.new(form_params)
				@cart_item.save
			end

			render json: @cart , status: 200

		
	end 

	def update 
		@cartitem = CartItem.find(params[:id])

		debugger
		if params[:decrease]

			@cartitem.update(quantity: (@cartitem.quantity - 1))
			redirect_to cart_items_path

		elsif params[:increase]
			@cartitem.update(quantity: (@cartitem.quantity + 1))
			redirect_to cart_items_path
	
		
		elsif params[:save_for_later]
			@cartitem.update(save_for_later: true)
			redirect_to cart_items_path
		
		elsif params[:move_to_cart]
			@cartitem.update(save_for_later: false)
			redirect_to cart_items_path
			

		elsif params[:remove_from_list]
			@cartitem.destroy
			redirect_to cart_items_path 
	

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
