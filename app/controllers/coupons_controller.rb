class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
  end

  def coupons_stored
    
  end

  def create
  end


end
