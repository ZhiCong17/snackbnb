class SnacksController < ApplicationController
  def show
  end

  def new
    @snack = Snack.new
  end

  def edit
    # @user = User.find(params[:id])
    # @user = current_user
    @snack = Snack.find(params[:id])
    # @snack.user = @user
  end

  def update
    @snack = Snack.find(params[:id])
    @snack.update(snack_params)
    redirect_to snack_path(@snack)
  end

  private

  def snack_params
    params.require(:snack).permit(:name, :description, :price, :quantity, :photo)
  end
end
