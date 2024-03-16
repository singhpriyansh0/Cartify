class Authorization
  def initialize(request)
    @token = request.headers[:HTTP_TOKEN]
  end
  def current_user
    token = JsonWebToken.decode(@token)[:email] if @token
    user = User.find_by(email: token["email"])
  end
end
