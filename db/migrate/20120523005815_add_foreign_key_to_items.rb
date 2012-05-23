class AddForeignKeyToItems < ActiveRecord::Migration
  def change
    add_foreign_key :items, :users
    add_foreign_key :items, :shops
  end
end
