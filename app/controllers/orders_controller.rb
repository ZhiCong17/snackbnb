class OrdersController < ApplicationController
  def show
    @user = current_user
    @order_lists = []
    @total = 0
    @order = Order.where(user_id: @user.id)
    @order.each do |order|
      order
      @order_list = OrderItem.where(order_id: order.id)
      @order_lists << @order_list
    end
  end
end
