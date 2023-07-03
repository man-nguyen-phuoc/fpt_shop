module Orders
  class UpdateQuantityItemableService
    def initialize(order_detail_items)
      @order_detail_items = order_detail_items
    end
    
    def call
      @order_detail_items.each do |order_detail_item|
        order_detail_item_quantity = order_detail_item.quantity
        itemable = order_detail_item.itemable

        itemable.update(quantity: itemable.quantity - order_detail_item_quantity)
      end
    end
  end
end