class DropActivity < ActiveRecord::Migration
  def change
    drop_table :activities
  end
end
