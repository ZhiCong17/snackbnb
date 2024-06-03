class ChangeOrderStatusDefaultToOrders < ActiveRecord::Migration[7.1]
  def change
    change_column :orders, :status, :string, default: "unpaid"
  end
end
