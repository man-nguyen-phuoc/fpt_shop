module CartsHelper
  def cart_summary(items)
    cart_summary = 0
    items.each do |item|
      cart_summary += item.total_price
    end
    return cart_summary
  end
end
