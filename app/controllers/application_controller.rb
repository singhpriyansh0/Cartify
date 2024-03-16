class ApplicationController < ActionController::Base
 # before_action :configure_permitted_parameters, if: :devise_controller?
   include ExceptionHandler
   before_action :authenticate

 protect_from_forgery unless: -> {request.format.json?}
 
 # include Separable

 private
   def authenticate


       @token = request.headers[:HTTP_TOKEN]
       

    if params[:token]
        token = JsonWebToken.decode(params[:token])

    else 
        token = JsonWebToken.decode(@token)
    end
        
    @current_user = User.find_by(email: token["email"])
  return current_user
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])
  # end
end
