class AddColumnPasswordComfirmationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_comfirmation, :integer
  end
end
