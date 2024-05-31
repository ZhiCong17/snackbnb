class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
