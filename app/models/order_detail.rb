class OrderDetail < ApplicationRecord
  has_one :order
  belongs_to :coupon, optional: true
  has_many :order_detail_items, as: :orderable, dependent: :destroy
end
