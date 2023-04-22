class AddThumbnailFromCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :thumbnail, :string
  end
end
