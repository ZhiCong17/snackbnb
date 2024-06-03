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
end
