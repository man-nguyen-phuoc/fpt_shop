class Product < ApplicationRecord
  has_one :configuration, dependent: :destroy
  belongs_to :category
  belongs_to :manufacture
end
