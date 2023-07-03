module OrderDetailItems
  class CreateService
    def initialize(order_detail, itemable, quantity)
      @order_detail = order_detail
      @itemable = itemable
      @quantity = quantity
    end

    def call
      @order_detail.order_detail_items.create(
        itemable: @itemable,
        quantity: @quantity
      )
    end
  end
end