class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :addresses
  has_many :orders
  has_one :cart

  after_create :create_cart  #filter

  def create_cart
    Cart.create!(user_id: self.id)  
  end
end
