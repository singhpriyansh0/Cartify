class Api::V1::AddressesController < ApplicationController
	
	# load_and_authorize_resource
	# skip_befor_action :verify_authenticity_token

   
	def index 
		user = User.find(params[:user_id])
		@addresses = user.addresses
		render json: @addresses , status: 200
	end
	
	# def all_address
	# 	@addresses = Address.where(user_id:current_user[:id])
	# end

	def select_address

		
		current_user = User.find(params[:id])
		 @address=current_user.addresses.find_by(default_address: true)
		 @select_address = current_user.addresses.where(default_address: false)
		 
		 	if params[:proceed]
		 		
    @user = User.find(params[:id])
    # @user.update()
    render json: {user: @user , address: @address , select_address: @select_address } , status: 200
  # redirect_to new_order_item_path
		 	end
		
	end 

	def show
	  	 @address = Address.find_by(id: params[:id])
	  	 render json: @address , status: 200
	end

	def edit
		 @address = Address.find_by(id: params[:id])
		@cities= City.pluck(:name , :id)
		render json: { address: @address , cities: @cities} ,staus: 200
			
	end

	def update
		 @address = Address.find_by(id: params[:id])
		
			if params[:def_address]
				@user_addresses = Address.where(user_id: current_user.id)
				puts @user_addresses
				# binding.pry

				@user_addresses.each do |e|
					e.update(default_address: "false")
				end

				 @address = Address.find_by(id: params[:id])
				@address.update(default_address: "true") 
				redirect_to address_path

			
			elsif params[:select_for_delivery]
				@user_addresses = Address.where(user_id: current_user.id)
				@user_addresses.each do |e|
					e.update(default_address: "false")
				end

				@def_address =Address.find(params[:id])
				@def_address.update(default_address: true)
				redirect_to select_address_addresses_path


			elsif params[:proceed]
		 		redirect_to new_order_item_path
		 
		

			elsif params[:edit_address]
				redirect_to edit_address_path

			elsif params[:remove_address]
				binding.pry
				@address.destroy
				redirect_to select_address_addresses_path

			elsif @address.update(address_param)
				redirect_to address_path



			else
				render "/edit"
			end



	end


	def new 
		@cities= City.pluck(:name , :id)
		puts @cities
		@address = Address.new 

		render json: @cities , status: 200
	end

	def create 
		current_user = User.find(params[:id])
		@address = current_user.addresses.new(address_param)
		if @address.save
			# redirect_to root_path
			render json: @address, status: 201 
		else
			render "/new"
		end
	end



private 
	def address_param
		params.require(:address).permit(:address_line_1, :address_line_2, :house_room_number, :landmark,:pin_code , :city_id)
	end

	

end
 