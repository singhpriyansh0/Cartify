class VariantsController < ApplicationController
	def show
		@variant = Variant.find(params[:id])
		@variants = Variant.where(product_id: @variant.product_id)
		@cart_item =CartItem.new
	end
end
