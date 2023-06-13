class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :code, nul: false
      t.integer :discount
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
