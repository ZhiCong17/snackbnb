class OrdersController < ApplicationController
  before_action :set_order, only: [:update_status, :show ]
  def cart
    @user = current_user
    @order_lists = []
    @total = 0
    @order = Order.where(user_id: @user.id, status: "unpaid")
    @order.each do |order|
      @order_list = OrderItem.where(order_id: order.id)
      @order_lists << @order_list
    end
  end

  def order_history
    @user = current_user
    @order_lists = []
    @total = 0
    @order = Order.where(user_id: @user.id, status: "paid")
    @order.each do |order|
      @order_list = OrderItem.where(order_id: order.id)
      @order_lists << @order_list
    end
  end

  def show
    @order
  end

  def update_status
    update_snack(@order)
    if @order.update!(status: "paid")
      # Successfully updated the order status to "paid"
      redirect_to cart_path, notice: "Order status updated to paid."
    else
      # Failed to update the order status
      render :cart
    end
  end

  def update_snack(order)
    order_items = order.order_items
    order_items.each do |item|
      snack = Snack.find_by(id: item.snack_id)
      snack_store = snack.quantity
      item = item.snack_quantity
      if snack_store > item
        current_store = snack_store - item
        snack.update!(quantity: current_store.to_i)
      end
    end
  end

  def set_order
    @order = Order.find_by(id: params[:id])
    unless @order
      redirect_to root_path, alert: "Order not found."
    end
  end
end
