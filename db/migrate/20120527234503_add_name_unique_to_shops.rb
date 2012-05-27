class AddNameUniqueToShops < ActiveRecord::Migration
  def change
    add_index :shops, [:name, :deleted_at], unique: true
  end
end
