module Carts
  class UpdateQuantityOrderDetailItem
    def initialize(order_detail_item)
      @order_detail_item = order_detail_item
    end

    def call
      @order_detail_item.update!(quantity: @order_detail_item.quantity + 1)
    end
  end
end