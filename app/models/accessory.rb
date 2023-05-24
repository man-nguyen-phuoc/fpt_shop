class Accessory < ApplicationRecord
  belongs_to :category
  belongs_to :manufacture
  has_one :configuration_accessory, dependent: :destroy
  has_many :order_detail_items, as: :itemable

  validates :name, length: { in: (6..20) }
  validates :price, comparison: { greater_than: 2_000_000 }
  validates :quantity, comparison: { greater_than: 0 }

  def real_price
    price - (price * discount / 100)
  end

  def discount
    0
  end
end
