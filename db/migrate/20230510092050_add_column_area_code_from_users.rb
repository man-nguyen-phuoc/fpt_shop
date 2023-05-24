class AddColumnAreaCodeFromUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :area_code, :integer
  end
end
