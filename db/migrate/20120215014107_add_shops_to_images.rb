class AddShopsToImages < ActiveRecord::Migration
  def change
    remove_column :images, :activity_id

    add_column :images, :shop_id, :integer, null: false, default: ""

    add_index :images, :shop_id
  end
end
