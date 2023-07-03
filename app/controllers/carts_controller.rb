class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:create]

  def index
    @index_facade = Carts::IndexFacade.new(current_user.cart,
                                           coupon_options: {
                                                             id: params[:coupon_id],
                                                             code: params[:coupon_code]
                                                           })
  end

  def create
    itemable = params[:itemable_type].constantize.find_by(id: params[:itemable_id])

    if itemable
      order_detail_item = @cart.order_detail_items.find_by(itemable: itemable)

      if order_detail_item
        Carts::UpdateQuantityOrderDetailItem.new(order_detail_item).call
      else
        Carts::CreateOrderDetailItem.new(@cart, itemable).call
      end
      redirect_to carts_path
    else
      redirect_back
    end
  end

  private

  def set_cart
    @cart = Cart.find_by(user_id: current_user.id)
  end
end
