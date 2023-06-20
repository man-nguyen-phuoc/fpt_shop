module CartsHelper
  def cart_summary_coupon(items, coupon)
    cart_summary = 0
    items.each do |item|
      cart_summary += item.total_price
    end

    if coupon
      cart_summary = (cart_summary - (coupon.price + 20000)) 
    else
      cart_summary - 20000
    end
  end

  def cart_summary(items)
    cart_summary = 0
    items.each do |item|
      cart_summary += item.total_price
    end
    cart_summary
  end
end
