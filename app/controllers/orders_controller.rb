class OrdersController < ApplicationController

  def show
    @user = current_user
    @order = Order.find_by(user_id: @user.id)
    @order_list = OrderItem.where(order_id: @order.id)
  end
end
