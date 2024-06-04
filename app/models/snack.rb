class Snack < ApplicationRecord
  belongs_to :user
  has_many :order_items

  has_one_attached :photo

  def related_products
    Snack.where.not(id: id).limit(4)
  end
end
