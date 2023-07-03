module Carts
  class IndexFacade
    def initialize(cart, coupon_options: {})
      @cart = cart
      @coupon_options = coupon_options
    end

    def all_coupons
      Coupon.where('quantity > 0')
    end

    def coupon_by
      Coupon.where(id: @coupon_options[:id]).or(Coupon.where(code: @coupon_options[:code])).first
    end

    def order_detail_items
      @cart.order_detail_items
    end

    def show_coupons
      Coupon.where('quantity > 0').limit(3)
    end
  end
end