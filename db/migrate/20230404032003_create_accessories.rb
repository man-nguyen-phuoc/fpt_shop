class CreateAccessories < ActiveRecord::Migration[7.0]
  def change
    create_table :accessories do |t|
      t.integer :category_id, null: false
      t.integer :manufacture_id, null: false
      t.string :name, null: false
      t.index :name
      t.decimal :price, null: false
      t.integer :quantity, null: false
      t.string :thumnail, null: false

      t.timestamps
    end
  end
end
