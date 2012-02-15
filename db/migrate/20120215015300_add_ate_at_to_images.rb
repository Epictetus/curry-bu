class AddAteAtToImages < ActiveRecord::Migration
  def change
    add_column :images, :ate_at, :date

    add_index :images, :ate_at
  end
end
