class AddSellNumberFromProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :sell_number, :integer
    add_column :products, :discount, :integer
  end
end
