class SnacksController < ApplicationController
  def show
  end

  def new
    @snack = Snack.new
  end

  def create
    @snack = Snack.new(snack_params)
    @snack.user = current_user

    if @snack.save
      redirect_to root_path
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

  private

  def snack_params
    params.require(:snack).permit(:name, :description, :price, :quantity, :photo)
  end
end
