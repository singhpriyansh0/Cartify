class Api::V1::HomeController < ApplicationController



def index
	binding.pry
	@category = Category.all
	
	@products = Product.all

	render json: { category: @category , product: @products }, status: 200


end 

def show 
	@category = Category.find(params[:id])
	@products = @category.products
	render json: { category: @category , product: @products }, status: 200

	
end

# def func
# 	@cities= City.all
# 	end 
end
