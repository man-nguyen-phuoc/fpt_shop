class Manufacture < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :products, dependent: :destroy
  has_many :accessories, dependent: :destroy

  validates :name, length: { in: (6..20) }
end
