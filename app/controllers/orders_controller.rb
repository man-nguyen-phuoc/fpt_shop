class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :import_shipping_address, only: [:create]
  after_action :update_quantity_itemable, only: [:create]
  after_action :update_quantity_coupon, only: [:create]

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def create
    coupon = Coupon.where(id: params[:coupon_id]).or(Coupon.where(code: params[:coupon_code])).first
    
    order = if params[:cart_id]
              order_detail = OrderDetail.create
              order_detail_items = current_user.cart.order_detail_items

              Orders::UpdateTotalPriceOrderDetailService.new(order_detail_items, order_detail, coupon).call

              Orders::CreateOrderFromCartService.new(order_detail, current_user).call
            else
              Orders::CreateOrderFromOrderDetailService.new(params[:order_detail_id], current_user).call
            end
    if order
      redirect_to orders_path
    else
      redirect_back fallback_location: order_details_path
    end
  end

  def show
    @show_facade = Orders::ShowFacade.new(params[:id], current_user)
  end

  private

  def import_shipping_address
    redirect_to edit_user_path(current_user) if current_user.shipping_address == nil
  end

  def update_quantity_itemable
    order_detail_items = Order.last.order_detail.order_detail_items

    Orders::UpdateQuantityItemableService.new(order_detail_items).call
  end

  def update_quantity_coupon
    if Order.last.order_detail.coupon_id
      Orders::UpdateQuantityCouponService.new().call
    end
  end
end