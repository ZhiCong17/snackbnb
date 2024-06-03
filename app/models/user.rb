class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :snacks
  has_many :orders

  def cart
    # if the user have cart or not
    # if yes, then we use that cart
    # if no, then create a new cart

    my_cart = orders.find_by(status: "unpaid")

    if my_cart.nil?
      Order.create(user: self)
    else
      my_cart
    end
  end

  def cart?
    cart.present?
  end
end
