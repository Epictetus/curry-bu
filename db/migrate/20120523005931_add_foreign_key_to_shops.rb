class AddForeignKeyToShops < ActiveRecord::Migration
  def change
    add_foreign_key :shops, :users, column: 'create_user_id'
    add_foreign_key :shops, :users, column: 'update_user_id'
  end
end
