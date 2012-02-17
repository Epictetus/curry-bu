class AddUserToShops < ActiveRecord::Migration
  def change
    add_column :shops, :create_user_id, :integer, null: false
    add_column :shops, :update_user_id, :integer, null: false
  end
end
