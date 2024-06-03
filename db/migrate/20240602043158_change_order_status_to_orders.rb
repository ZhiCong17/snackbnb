class ChangeOrderStatusToOrders < ActiveRecord::Migration[7.1]
  def change
    change_column :orders, :status, :string
  end
end
