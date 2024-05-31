class SearchController < ApplicationController

  def index
    @q = Snack.ransack()
  end
end
