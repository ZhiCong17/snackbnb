class OrderItem < ApplicationRecord
  belongs_to :snack
  belongs_to :order
end
