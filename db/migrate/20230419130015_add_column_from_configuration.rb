class AddColumnFromConfiguration < ActiveRecord::Migration[7.0]
  def change
    add_column :configurations, :ram, :integer
  end
end
