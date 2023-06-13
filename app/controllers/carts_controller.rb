class CartsController < ApplicationController
  def index
    @user = current_user
    @order_detail_items = @user.cart.order_detail_items

    @coupons = Coupon.all.order(:price)

    if params[:coupon_id]
      @coupon = Coupon.find(params[:coupon_id])
    elsif params[:coupon_code]
      @coupon = Coupon.find_by(code: params[:coupon_code])
    end
  end

  def create
    user = current_user
    cart = Cart.find_by(user_id: user.id)

    itemable = params[:itemable_type].constantize.find_by(id: params[:itemable_id])

    if itemable
      order_detail_item = cart.order_detail_items.find_by(itemable: itemable)

      if order_detail_item
        order_detail_item.update!(quantity: order_detail_item.quantity + 1)
      else
        cart.order_detail_items.create!(
          orderable: cart,
          itemable: itemable
        )
      end

      redirect_to user_carts_path(user)
    else
      redirect_back
    end
  end
end
