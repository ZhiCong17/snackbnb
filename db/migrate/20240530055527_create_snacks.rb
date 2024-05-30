class CreateSnacks < ActiveRecord::Migration[7.1]
  def change
    create_table :snacks do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :quantity
      t.string :image_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
