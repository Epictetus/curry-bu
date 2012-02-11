class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title, null: false
      t.text :comment
      t.string :image, null: false
      t.references :activity, null: false

      t.timestamps
    end
    add_index :images, :activity_id
  end
end
