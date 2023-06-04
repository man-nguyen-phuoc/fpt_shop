class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = Order.all.order(created_at: :desc)
  end

  def create
    user = current_user

    order = if params[:cart_id]
              # Tao order detail
              order_detail = OrderDetail.create(
                total_price: 0
              )

              total_price = 0

              order_detail_items = current_user.cart.order_detail_items

              order_detail_items.each do |item|
                item.orderable = order_detail
                item.save

                total_price += item.itemable.real_price * item.quantity
              end

              order_detail.update!(total_price: total_price)

              Order.create(
                user_id: user.id,
                shipping_address_id: user.shipping_address.id,
                order_key: Faker::Code.asin,
                order_detail: order_detail,
                status: 'Verifying'
              )
              # Doi tat ca order detail item sang order detail
              # Tao order cho order detail tren
            else
              Order.create(
                user_id: user.id,
                order_detail_id: params[:order_detail_id],
                shipping_address_id: user.shipping_address.id,
                order_key: Faker::Code.asin,
                status: 'Verifying'
              )
            end

    if order
      redirect_to user_orders_path(user)
    else
      redirect_back fallback_location: order_details_path
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    @user = current_user

    @order_detail = @order.order_detail
    @shipping_address = @user.shipping_address

    @order_detail_items = @order_detail.order_detail_items
  end
end
