class ChangeUsersImage < ActiveRecord::Migration
  def change
    change_column :users, :login_name, :string, null: false
  end
end
