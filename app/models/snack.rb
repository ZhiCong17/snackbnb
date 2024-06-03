class Snack < ApplicationRecord
  belongs_to :user
  has_many :order_items

  has_one_attached :photo
end
