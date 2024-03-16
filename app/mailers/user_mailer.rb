class UserMailer < ApplicationMailer

	default from: 'emailk address'

require "json"   
  def welcome_email(user)
  

    @user = JSON.parse user

    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user["email"], subject: 'Welcome to My Awesome Site')
  end
  
end
