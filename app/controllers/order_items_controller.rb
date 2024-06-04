class OrderItemsController < ApplicationController
  def create
    # find the cart
    @cart = current_user.cart
    # find the snack
    @snack = Snack.find(params[:snack_id])
    @order_item = OrderItem.new(
      order: @cart,
      snack: @snack,
      snack_quantity: params[:order_item][:snack_quantity]
    )

    if @order_item.save
      redirect_to cart_path
    end
  end

  def destroy
    @order_item = OrderItem.find_by(id: params[:id])
    # raise
    if @order_item.destroy!
      redirect_to cart_path, notice: "Order item was successfully removed."
    else
      redirect_to cart_path, alert: "Failed to remove order item."
    end
  end
end
