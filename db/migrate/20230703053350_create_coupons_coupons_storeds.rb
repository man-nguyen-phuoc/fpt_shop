class CreateCouponsCouponsStoreds < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons_coupons_storeds do |t|
      t.belongs_to :coupon
      t.belongs_to :coupons_stored

      t.timestamps
    end
  end
end
