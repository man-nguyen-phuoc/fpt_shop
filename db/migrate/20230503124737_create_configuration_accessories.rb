class CreateConfigurationAccessories < ActiveRecord::Migration[7.0]
  def change
    create_table :configuration_accessories do |t|
      t.integer :accessory_id
      t.string :connect_type
      t.text :feature

      t.timestamps
    end
  end
end
