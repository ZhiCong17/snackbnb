class RemoveColumnFromSnacks < ActiveRecord::Migration[7.1]
  def change
    remove_column :snacks, :image_url, :string
  end
end
