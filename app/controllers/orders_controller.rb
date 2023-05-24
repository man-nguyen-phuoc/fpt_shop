class OrdersController < ApplicationController
  def index
    @user = User.first
    @order = Order.create(
      user_id: params[:user_id],
      order_detail_id: params[:order_detail_id],
      shipping_address_id: @user.shipping_address.id,
      order_key: Faker::Code.asin,
      status: 'Verifying'
    )
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
    @user = User.find(params[:user_id])

    @order_detail = @order.order_detail
    @shipping_address = @user.shipping_address

    @order_detail_items = @order_detail.order_detail_items

  end
end
