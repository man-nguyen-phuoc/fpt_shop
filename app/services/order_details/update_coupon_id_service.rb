module OrderDetails
  class UpdateCouponIdService    
    def initialize(order_detail, coupon)
      @order_detail = order_detail
      @coupon = coupon
    end

    def call
      @order_detail.update(coupon_id: @coupon.id)
    end
  end
end