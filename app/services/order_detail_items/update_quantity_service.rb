module OrderDetailItems
  class UpdateQuantityService
    def initialize(order_detail_item, quantity)
      @order_detail_item = order_detail_item
      @quantity = quantity
    end

    def call
      @order_detail_item.update!(quantity: @quantity)
    end
  end
end