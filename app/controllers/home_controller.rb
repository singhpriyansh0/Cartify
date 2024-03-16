class HomeController < ApplicationController
include Separable


def index
	binding.pry
	@category = Category.all
	@products = Product.all

end 

def show 
	@category = Category.find(params[:id])
	@products = @category.products
end

# def func
# 	@cities= City.all
# 	end 
end
