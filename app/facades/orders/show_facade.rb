module Orders
  class ShowFacade
    def initialize(id, current_user)
      @id = id
      @current_user = current_user
    end

    def order
      @order = Order.find_by(id: @id)
    end

    def order_detail
      @order_detail = order.order_detail
    end

    def shipping_address
      @current_user.shipping_address
    end

    def order_detail_items
      order_detail.order_detail_items
    end

    def coupon
      Coupon.find(order_detail.coupon_id) if order_detail.coupon_id  
    end
  end
end