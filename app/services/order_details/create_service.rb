module OrderDetails
  class CreateService
    def initialize(itemable, quantity)
      @itemable = itemable
      @quantity = quantity
    end

    def call
      OrderDetail.create!(total_price: @itemable.real_price * @quantity.to_i)
    end
  end
end