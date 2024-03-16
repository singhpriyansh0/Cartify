class Api::V1::VariantsController < ApplicationController
	def show
		@variant = Variant.find(params[:id])
		@variants = Variant.where(product_id: @variant.product_id)
		@cart_item =CartItem.new

			render json: { variant: @variant, variants: @variants , cart_item: @cart_item} , status: 200
	end
end
