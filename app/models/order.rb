class Order < ApplicationRecord
  belongs_to :order_detail, dependent: :destroy
  belongs_to :user, class_name: 'User'
end
