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
    @order = Order.where(user_id: @user.id, status: "paid").order(created_at: :desc)
    @order.each do |order|
      @order_list = OrderItem.where(order_id: order.id)
      @order_lists << @order_list
    end
  end

  def show
    @order
  end

  def update_status
    @order_lists = []
    @order_list = @order.order_items
    @order_lists << @order_list
    @order_lists.each do |items|
      item = items.first
      snack = Snack.find_by(id: item.snack_id)
      snack_store = snack.quantity
      item_quantity = item.snack_quantity
      @total = item.snack_quantity * snack.price
      if snack_store >= item_quantity
        current_store = snack_store - item_quantity
        snack.update!(quantity: current_store.to_i)
        @order.update!(status: "paid")
        redirect_to cart_path, alert: "Order status updated to paid."
      else
        redirect_to cart_path, alert: "Not enough stock, please remove Order: #{@order.id}."
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
