class CreateItemComments < ActiveRecord::Migration
  def change
    create_table :item_comments do |t|
      t.references :item,   null: false
      t.references :user,   null: false
      t.text :comment,      null: false
      t.datetime :deleted_at

      t.timestamps
    end
    add_foreign_key :item_comments, :items
    add_foreign_key :item_comments, :users
  end
end
