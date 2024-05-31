class SnacksController < ApplicationController
  def mine
    @snacks = Snack.where(user: current_user)
  end
  
  def show
    @snack = Snack.find(params[:id])
    @query_params = {
      cart: 5
    }
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

  def add_to_cart

  end

  private

  def snack_params
    params.require(:snack).permit(:name, :description, :price, :quantity, :photo)
  end

  # def cart_params
  #   if Order.present?

  #   else

  #   end
  # end
end
