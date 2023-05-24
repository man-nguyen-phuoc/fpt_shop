class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.integer :order_detail_id, null: false
      t.integer :shipping_address_id, null: false
      t.string :order_key, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
