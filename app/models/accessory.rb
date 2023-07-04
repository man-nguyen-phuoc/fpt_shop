class Accessory < ApplicationRecord
  belongs_to :category
  belongs_to :manufacture
  has_one :configuration_accessory, dependent: :destroy
  has_many :order_detail_items, as: :itemable

  validates :name, length: { in: (6..20) }
  validates :price, comparison: { greater_than: 2_000_000 }
  validates :quantity, comparison: { greater_than: 0 }
  validates :sell_number, comparison: { greater_than: 0 }
  validates :discount, numericality: { in: 0..100}


  # TODO: update unit test
  def real_price
    price - (price * discount / 100)
  end
end
