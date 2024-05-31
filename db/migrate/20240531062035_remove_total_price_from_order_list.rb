class RemoveTotalPriceFromOrderList < ActiveRecord::Migration[7.1]
  def change
    remove_column :order_items, :total_price, :float
  end
end
