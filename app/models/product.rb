class Product < ApplicationRecord
  has_one :configuration, dependent: :destroy
  belongs_to :category
  belongs_to :manufacture
  has_many :order_detail_items, as: :itemable

  def real_price
    price - (price * discount / 100)
  end
end
