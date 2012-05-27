class AddLoginNameUniqueToUsers < ActiveRecord::Migration
  def change
    remove_index :users, name: :index_users_on_login_name
    add_index :users, [:login_name, :deleted_at], unique: true
  end
end
