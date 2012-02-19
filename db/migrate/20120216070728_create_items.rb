class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title,    null: false
      t.text :comment
      t.string :image,    null: false
      t.date :ate_at,     null: false
      t.references :user, null: false
      t.references :shop, null: false

      t.timestamps
    end
    add_index :items, :user_id
    add_index :items, :shop_id
    add_index :items, :ate_at
  end
end
