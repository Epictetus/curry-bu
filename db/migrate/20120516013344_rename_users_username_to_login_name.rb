class RenameUsersUsernameToLoginName < ActiveRecord::Migration
  def change
    remove_index :users, name: :index_users_on_name
    rename_column :users, :username, :login_name
    add_index :users, :login_name, unique: true
  end
end
