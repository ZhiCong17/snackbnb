class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    raise
    @q = Snack.ransack(params[:q])
    @snacks = @q.result(distinct: true)
  end

end
