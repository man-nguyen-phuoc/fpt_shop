class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :manufacture_id, null:false
      t.integer :category_id, null: false
      t.string :name, null: false
      t.index :name
      t.integer :quantity, null: false
      t.decimal :price, null: false
      t.string :thumbnail, null: false

      t.timestamps
    end
  end
end
