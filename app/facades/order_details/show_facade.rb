module OrderDetails
  class ShowFacade
    def initialize(order_detail)
      @order_detail = order_detail
    end

    def order_detail_items
      @order_detail.order_detail_items
    end

    def coupon
      @order_detail.coupon
    end

    def all_coupons
      Coupon.all
    end
  end
end