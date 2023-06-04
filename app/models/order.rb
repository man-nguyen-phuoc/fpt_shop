class Order < ApplicationRecord
  belongs_to :order_detail, dependent: :destroy
  belongs_to :user
end
