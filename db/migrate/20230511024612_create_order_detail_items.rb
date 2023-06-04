class CreateOrderDetailItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_detail_items do |t|
      t.integer :order_detail_id, null: false
      t.integer :itemable_id, null: false
      t.string :itemable_type, null: false
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
