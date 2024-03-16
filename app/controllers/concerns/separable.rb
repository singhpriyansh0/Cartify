module Separable
	extend ActiveSupport::Concern

	included do
		# before_action :authenticate_user!
	end

	
	def find_address
	  @address = Address.find_by(id: params[:id])
	end

	

end