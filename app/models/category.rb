class Category < ApplicationRecord
  has_and_belongs_to_many :manufactures
  has_many :accessories, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :name, length: { in: (6..20) }
end
