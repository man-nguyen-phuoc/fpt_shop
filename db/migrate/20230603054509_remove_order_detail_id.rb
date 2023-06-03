class RemoveOrderDetailId < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_detail_items, :order_detail_id
  end
end
