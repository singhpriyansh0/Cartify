module Auth
class Authentication
  def initialize(user_object)
    @username = user_object[:email]
    @password = user_object[:password]
    @user = User.find_by(email: @email)
  end
  def authenticate
    @user && @user.authenticate(@password)
  end
  def generate_token
    JsonWebToken.encode(user_id: @user.id)
  end
end
end
