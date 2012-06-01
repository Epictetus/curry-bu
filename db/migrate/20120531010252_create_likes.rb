class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, null: false
      t.integer :likeable_id, null: false
      t.string :likeable_type, null: false, limit: 20
      t.timestamps
    end
    add_index :likes, [:likeable_id, :likeable_type, :user_id], unique: true

    add_foreign_key :likes, :users
  end
end
