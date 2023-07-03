class OrderDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order_detail, only: [:show, :update]

  def show
    @show_facade = OrderDetails::ShowFacade.new(@order_detail)
  end

  def create
    itemable = params[:itemable_type].constantize.find_by(id: params[:itemable_id])

    ActiveRecord::Base.transaction do
      @order_detail = OrderDetails::CreateService.new(itemable, params[:quantity]).call
      order_detail_item = OrderDetailItems::CreateService.new(@order_detail, itemable, params[:quantity]).call
    end

    redirect_to order_detail_path(@order_detail)
  end

  def update
    order_detail_item = OrderDetailItem.find(params[:order_detail_item_id])
    order_detail = order_detail_item.orderable

    if order_detail_item
      OrderDetailItems::UpdateQuantityService.new(order_detail_item, params[:quantity]).call if params[:quantity]

      if params[:coupon_id] || params[:coupon_code] 
        coupon = Coupon.where(id: params[:coupon_id]).or(Coupon.where(code: params[:coupon_code])).first

        OrderDetails::UpdateCouponIdService.new(order_detail, coupon).call
        OrderDetails::UpdateTotalPriceService.new(order_detail, order_detail_item, coupon).call
      end                                                  
    end

    redirect_to order_detail_path(order_detail)
  end

  private

  def set_order_detail
    @order_detail = OrderDetail.find(params[:id])
  end
end
