class Cart < ApplicationRecord
  has_many :order_detail_items
  belongs_to :user
end
