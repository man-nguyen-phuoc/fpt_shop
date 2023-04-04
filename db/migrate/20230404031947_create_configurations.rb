class CreateConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :configurations do |t|
      t.integer :product_id, null: false
      t.text :screens
      t.string :backside_camera
      t.string :front_camera
      t.string :memory_in
      t.string :cpu
      t.string :gpu
      t.string :battery_capacity
      t.string :sim
      t.string :operating_system
      t.string :made_by
      t.date :released_time

      t.timestamps
    end
  end
end
