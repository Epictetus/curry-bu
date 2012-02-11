class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.text :comment
      t.date :ate_at, null: false
      t.references :shop, null: false

      t.timestamps
    end
    add_index :activities, :shop_id
  end
end
