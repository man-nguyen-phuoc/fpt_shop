module OrderDetailsHelper
  def order_summary(item, quantity)
    item.real_price * quantity.to_i
  end

  def order_summary_coupon(item, coupon)
    order_summary = item.itemable.real_price * item.quantity.to_i

    if coupon
      order_summary = (order_summary - coupon.price)
    else
      order_summary
    end
  end

  
end
