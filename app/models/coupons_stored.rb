class CouponsStored < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :coupons
end
