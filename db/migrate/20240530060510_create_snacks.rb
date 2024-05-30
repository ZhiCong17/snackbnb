class CreateSnacks < ActiveRecord::Migration[7.1]
  def change
    create_table :snacks do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
