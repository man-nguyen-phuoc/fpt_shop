class Cart < ApplicationRecord
  has_many :order_detail_items, as: :orderable
  belongs_to :user
end
