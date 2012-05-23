class CreateItemComments < ActiveRecord::Migration
  def change
    create_table :item_comments do |t|
      t.references :item
      t.text :comment
      t.references :user
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :item_comments, :item_id
    add_index :item_comments, :user_id
  end
end
