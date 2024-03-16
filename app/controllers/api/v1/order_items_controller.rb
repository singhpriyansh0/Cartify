class Api::V1::OrderItemsController < ApplicationController
	def index
		current_user= User.find(params[:id])
		@orders = Order.where(user_id: current_user.id)
 		@order  = Order.all
 		binding.pry
 		render json: @orders , status: 200 
	end

	def show 

		@orders = OrderItem.where(order_id: OrderItem.find(params[:id]).order_id)

		render json: @orders , status: 200

		# @order_items = OrderIteam.where(order_id: params[:id])
	end

	def new 
		@cart_items = Cart.find_by(user_id: current_user.id).cart_items.where(save_for_later: false) 
		@order = OrderItem.new	
		render json: {cart_items: @cart_items , order: @order}, status: 200
	end 

	def create
		cart_id = current_user.cart
		cart_items = current_user.cart.cart_items
		address = Address.find_by(default_address: true)
		order = address.orders.create(status:"pending" , user_id: current_user.id)

		cart_items.each do |e|
			price = e.variant.price
			order_item= OrderItem.create(price: price , quantity: e.quantity, order_id: order.id , variant_id: e.variant_id)
		end
		CartItem.destroy_by(cart_id: cart_id)
		
		redirect_to payments_path

	
	end 
end
