class AddImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string, after: :login_name
  end
end
