class AddCouponToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :coupon_id, :integer
  end
end
