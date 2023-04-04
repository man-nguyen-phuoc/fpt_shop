class Product < ApplicationRecord
  has_one :configuration
  belongs_to :category
  belongs_to :manufacture
end
