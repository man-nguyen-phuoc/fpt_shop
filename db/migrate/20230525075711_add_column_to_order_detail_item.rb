class AddColumnToOrderDetailItem < ActiveRecord::Migration[7.0]
  def change
    add_column :order_detail_items, :orderable_id, :integer
    add_column :order_detail_items, :orderable_type, :string
  end
end
