module Orders
  class CreateOrderFromOrderDetailService
    def initialize(order_detail_id, current_user)
      @order_detail_id = order_detail_id
      @current_user = current_user
    end

    def call
      Order.create!(
        user_id: @current_user.id,
        order_detail_id: @order_detail_id,
        shipping_address_id: @current_user.shipping_address.id,
        order_key: Faker::Code.asin,
        status: 'Verifying'
      )
    end
  end
  
end