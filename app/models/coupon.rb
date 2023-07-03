class Coupon < ApplicationRecord
  has_and_belongs_to_many :coupons_storeds
end
