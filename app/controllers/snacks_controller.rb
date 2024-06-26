class SnacksController < ApplicationController
  def mine
    @snacks = Snack.where(user: current_user)
  end

  def show
    @snack = Snack.find(params[:id])
    @order_item = OrderItem.new
  end

  def new
    @snack = Snack.new
  end

  def create
    @snack = Snack.new(snack_params)
    @snack.user = current_user

    if @snack.save
      redirect_to snack_path(@snack)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @snack = Snack.find(params[:id])
  end

  def update
    @snack = Snack.find(params[:id])
    @snack.update(snack_params)
    redirect_to snack_path(@snack)
  end

  def destroy
    @snack = Snack.find(params[:id])
    # raise
    if @snack.destroy!
      redirect_to mine_path, alert: "#{@snack.name} successful remove from my list"
    else
      redirect_to mine_path, alert: "Failed to remove #{@snack.name}."
    end
  end

  def add_to_cart
    @snack = Snack.find(params[:id])
    @cart = current_user.cart
    @order_item = OrderItem.new
    @query_params = { product: @snack.id }
  end

  # def get_email_username(email)
  #   email.split('@')[0]
  #   @username = get_email_username(email)
  # end

  private

  def snack_params
    params.require(:snack).permit(:name, :description, :price, :quantity, :photo)
  end
end
