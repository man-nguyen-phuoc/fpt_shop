class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :update_shipping_address, only: [:create]

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def create
    if params[:coupon_id]
      coupon = Coupon.find(params[:coupon_id])
    elsif params[:coupon_code]
      coupon = Coupon.find_by(code: params[:coupon_code])
    end
    
    # 
    order = if params[:cart_id]
            # Tao order detail
              order_detail = OrderDetail.create

              total_price = 0

              order_detail_items = current_user.cart.order_detail_items

              order_detail_items.each do |item|
                item.orderable = order_detail
                item.save

                total_price += item.itemable.real_price * item.quantity
              end

              total_price = total_price - coupon.price if coupon

              order_detail.update(total_price: total_price)

              Order.create(
                user_id: current_user.id,
                shipping_address_id: current_user.shipping_address.id,
                order_key: Faker::Code.asin,
                order_detail: order_detail,
                status: 'Verifying'
              )

              # Doi tat ca order detail item sang order detail
              # Tao order cho order detail tren
            else
              Order.create!(
                user_id: current_user.id,
                order_detail_id: params[:order_detail_id],
                shipping_address_id: current_user.shipping_address.id,
                order_key: Faker::Code.asin,
                status: 'Verifying'
              )
            end

    if order
      redirect_to orders_path
    else
      redirect_back fallback_location: order_details_path
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    @order_detail = @order.order_detail
    @shipping_address = current_user.shipping_address

    @order_detail_items = @order_detail.order_detail_items
  end

  def placed
  end

  private

  def update_shipping_address
    redirect_to edit_user_path(current_user) if current_user.shipping_address == nil
  end
end