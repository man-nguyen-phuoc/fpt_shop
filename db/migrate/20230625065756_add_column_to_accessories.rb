class AddColumnToAccessories < ActiveRecord::Migration[7.0]
  def change
    add_column :accessories, :feature, :string
  end
end
