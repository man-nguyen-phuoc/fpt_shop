class CreateManufactureCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_manufactures do |t|
      t.belongs_to :manufacture
      t.belongs_to :category

      t.timestamps
    end
  end
end
