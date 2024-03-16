class AddressesController < ApplicationController	
	include Separable
   
	def index 
		user = User.find(params["user_id"])
		@addresses = user.addresses
	end
	
	# def all_address
	# 	@addresses = Address.where(user_id:current_user[:id])
	# end

	def select_address
		 @address=current_user.addresses.find_by(default_address: true)
		 @select_address = current_user.addresses.where(default_address: false)
		 
		 	if params[:proceed]
		 		redirect_to new_order_item_path
		 	end
		
	end 

	def show
	  	find_address
	end

	def edit
		find_address
		@cities= City.pluck(:name , :id)
			
	end

	def update
		binding.pry

		@address  = find_address
		user = User.find(params["user_id"])
		
			if params[:def_address]
				@user_addresses = Address.where(user_id: user.id)
				puts @user_addresses
				binding.pry

				@user_addresses.each do |e|
					e.update(default_address: "false")
				end

				find_address
				@address.update(default_address: "true") 
				render :show,status: 200
				# redirect_to address_path

			
			elsif params[:select_for_delivery]

				@user_addresses = Address.where(user_id: user.id)
				@user_addresses.each do |e|
					e.update(default_address: "false")
				end

				@def_address =Address.find(params[:id])
				@def_address.update(default_address: true)
				# redirect_to select_address_addresses_path 
				 render :show ,status: 200


			elsif params[:proceed]
		 		redirect_to new_order_item_path
		 
		

			elsif params[:edit_address]
				redirect_to edit_address_path

			elsif params[:remove_address]
				binding.pry
				@address.destroy
				# redirect_to select_address_addresses_path
				render :show , status: 200

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
	end

	def create 
		binding.pry
		user = User.find(params["user_id"])
		@address = user.addresses.new(address_param)

		if @address.save
			# redirect_to root_path
			render :show , status: :created
		else
			render :new
		end
	end



private 
	def address_param
		binding.pry
		params.require(:address).permit(:address_line_1, :address_line_2, :house_room_number, :landmark,:pin_code , :city_id)
	end

	

end
 