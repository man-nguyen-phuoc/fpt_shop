class AddSellNumberToAccessories < ActiveRecord::Migration[7.0]
  def change
    add_column :accessories, :sell_number, :integer
    add_column :accessories, :discount, :integer
  end
end
