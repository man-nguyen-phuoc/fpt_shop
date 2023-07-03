module OrderDetails
  class UpdateTotalPriceService   
    def initialize(order_detail, order_detail_item, coupon)
      @order_detail = order_detail
      @coupon = coupon
      @order_detail_item = order_detail_item
    end

    def call
      @order_detail.update!(total_price:  (@order_detail_item.quantity * @order_detail_item.itemable.real_price + 20_000) - @coupon.price)
    end
  end
end