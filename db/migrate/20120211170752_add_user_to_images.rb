class AddUserToImages < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.references :user, null: false, default: ""
    end
    add_index :images, :user_id
  end
end
