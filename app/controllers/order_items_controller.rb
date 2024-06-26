class OrderItemsController < ApplicationController
  def create
    # find the cart
    @cart = current_user.cart
    # find the snack
    @snack = Snack.find(params[:snack_id])
    # current cart order
    # compare cart inner item
    orders = current_user.cart.order_items
    check = orders.where(snack: @snack).empty?

    if check
      @order_item = OrderItem.new(
        order: @cart,
        snack: @snack,
        snack_quantity: params[:order_item][:snack_quantity]
      )
      if @order_item.save
        redirect_to cart_path
      end

    else
      snack_quantity = params[:order_item][:snack_quantity]
      cart_quantity = orders.first.snack_quantity
      current_quantity = cart_quantity + snack_quantity.to_i
      if current_quantity <= @snack.quantity
        orders.update!(snack_quantity: current_quantity)
        redirect_to cart_path
      else
        redirect_to snack_path(@snack), alert: "Fail to add into cart. #{@snack.name} contains #{cart_quantity}pcs in cart.Hit the store limit quantity"
      end
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
