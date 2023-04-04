class Accessory < ApplicationRecord
  belongs_to :category
  belongs_to :manufacture

  validates :name, length: { in: (6..20) }
  validates :price, comparison: { greater_than: 2_000_000 }
  validates :quantity, comparison: { greater_than: 0 }
end
