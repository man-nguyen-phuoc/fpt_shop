module Carts
  class CreateOrderDetailItem
    def initialize(cart, itemable)
      @cart = cart
      @itemable = itemable
    end

    def call
      @cart.order_detail_items.create!(orderable: @cart, itemable: @itemable)
    end
  end
end