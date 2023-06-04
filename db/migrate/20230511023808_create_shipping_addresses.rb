class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.integer :user_id, null: false
      t.string :city
      t.string :district
      t.string :address
      t.string :receiver_name
      t.integer :receiver_phone_number

      t.timestamps
    end
  end
end
