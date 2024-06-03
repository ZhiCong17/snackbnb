class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :snacks
  has_many :orders

  def cart
    Order.where(
      user: self,
      status: 'unpaid'
    ).first
  end

  def cart?
    cart.present?
  end
end
