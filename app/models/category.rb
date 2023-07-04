class Category < ApplicationRecord
  has_and_belongs_to_many :manufactures
  has_many :accessories, dependent: :destroy
  has_many :products, dependent: :destroy

  # TODO: Update Unit Test
  validates :name, length: { in: (6..20) }

  enum category_type: %i[product accessory]
end
