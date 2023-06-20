class OrderDetailsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_order_detail, only: [:show, :update]

  def show
    @order_detail_items = @order_detail.order_detail_items
    @coupon = @order_detail.coupon
    @coupons = Coupon.all
  end

  def create
    itemable = params[:itemable_type].constantize.find_by(id: params[:itemable_id])

    order_detail = OrderDetail.create!(total_price: itemable.real_price * params[:quantity].to_i)

    order_detail.order_detail_items.create(
      itemable: itemable,
      quantity: params[:quantity]
    )

    redirect_to order_detail_path(order_detail)
  end

  def update
    order_detail_item = OrderDetailItem.find(params[:order_detail_item_id])
    order_detail = order_detail_item.orderable

    if order_detail_item

      update_quantity(order_detail_item) if params[:quantity]
      apply_coupon(order_detail_item) if params[:coupon_id] || params[:coupon_code]
    end

    coupon = Coupon.find(params[:coupon_id]) if params[:coupon_id]
    coupon = Coupon.find_by(code: params[:coupon_code]) if params[:coupon_code]

    if coupon
      order_detail.update(total_price: update_total_price(order_detail_item, coupon))
    end

    redirect_to order_detail_path(order_detail)
  end

  private

  def set_order_detail
    @order_detail = OrderDetail.find(params[:id])
  end

  def update_quantity(order_detail_item)
    order_detail_item.update(quantity: params[:quantity])
  end

  def apply_coupon(order_detail_item)
    coupon = Coupon.where(id: params[:coupon_id]).or(Coupon.where(code: params[:coupon_code])).first
    @order_detail.update(coupon_id: coupon.id)
  end

  def update_total_price(order_detail_item, coupon)
    (order_detail_item.quantity * order_detail_item.itemable.real_price + 20_000) - coupon.price
  end
end
