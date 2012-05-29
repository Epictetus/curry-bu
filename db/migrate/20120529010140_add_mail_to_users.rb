class AddMailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mail, :string, null: false, after: :id
    add_index :users, [:mail, :deleted_at], unique: true
  end
end
