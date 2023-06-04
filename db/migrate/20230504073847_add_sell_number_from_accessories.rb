class AddSellNumberFromAccessories < ActiveRecord::Migration[7.0]
  def change
    add_column :accessories, :sell_number, :integer
  end
end
