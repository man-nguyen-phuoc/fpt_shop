module Orders
  class CreateOrderFromCartService
    def initialize(order_detail, current_user)
      @order_detail = order_detail
      @current_user = current_user
    end

    def call
      Order.create(
        user_id: @current_user.id,
        shipping_address_id: @current_user.shipping_address.id,
        order_key: Faker::Code.asin,
        order_detail: @order_detail,
        status: 'Verifying'
      )
    end
  end
  
end