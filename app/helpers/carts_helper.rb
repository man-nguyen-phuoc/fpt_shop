module CartsHelper
  def cart_summary(items)
    cart_summary = 0
    items.each do |item|
      cart_summary += (item.itemable.real_price * item.quantity.to_i)
    end
    return cart_summary
  end
end
