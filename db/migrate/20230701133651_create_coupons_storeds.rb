class CreateCouponsStoreds < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons_storeds do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
