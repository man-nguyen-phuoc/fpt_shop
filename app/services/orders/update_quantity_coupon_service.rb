module Orders
  class UpdateQuantityCouponService
    def call
      coupon = Coupon.find(Order.last.order_detail.coupon_id)
      coupon.update(quantity: coupon.quantity - 1)
    end
  end
end