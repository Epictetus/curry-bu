class AddUserToActivity < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.references :user, null: false, default: ""
    end
    add_index :activities, :user_id
  end
end
