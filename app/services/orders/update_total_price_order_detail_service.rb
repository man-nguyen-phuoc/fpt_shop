module Orders
class UpdateTotalPriceOrderDetailService
  def initialize(order_detail_items, order_detail, coupon)
    @order_detail_items = order_detail_items
    @order_detail = order_detail
    @coupon = coupon
  end

  def call
    @total_price = total_price(@order_detail_items, @order_detail)
    total_price = set_total_price_with_coupon(@coupon, @total_price)
    
    @order_detail.update(total_price: total_price)
  end

  private

  def set_total_price_with_coupon(coupon, total_price)
    if coupon
      (total_price - coupon.price) + 20_000
    else
      total_price + 20_000
    end
  end

  def total_price(order_detail_items, order_detail)
    total_price = 0

    order_detail_items.each do |item|
      item.orderable = order_detail
      item.save

      total_price += item.itemable.real_price * item.quantity
    end
    total_price
  end
end  
end