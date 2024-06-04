class Snack < ApplicationRecord
  belongs_to :user
  has_many :order_items

  has_one_attached :photo

  def image_with_default
    if photo.key?
      photo.key
    end
  end
end
