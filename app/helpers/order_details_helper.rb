module OrderDetailsHelper
  def order_summary(item, quantity)
    item.real_price * quantity.to_i
  end
end
