class Snack < ApplicationRecord
  belongs_to :user

  def index
    @snacks = Snack.all
  end

end
