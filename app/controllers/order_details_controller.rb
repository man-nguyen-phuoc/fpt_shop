class OrderDetailsController < ApplicationController
  def index
    @user = current_user
    if params['/order_details'] && params['/order_details'][:order_detail_item_id]
      @order_detail_item = OrderDetailItem.find_by(id: params['/order_details'][:order_detail_item_id])
    else
      @itemable = params[:itemable_type].constantize.find_by(id: params[:itemable_id])

      @order_detail = OrderDetail.create(total_price: @itemable.real_price * params[:quantity].to_i)
      @order_detail_item = @order_detail.order_detail_items.create(
        itemable: @itemable,
        quantity: params[:quantity]
      )
    end
  end

  def create
    @order_detail_item = OrderDetailItem.find_by(id: params['/order_details'][:order_detail_item_id])
    @order_detail_item.update(quantity: params['/order_details'][:quantity])

    @order_detail_item.orderable.update(total_price: @order_detail_item.itemable.real_price * params['/order_details'][:quantity].to_i)

    redirect_to order_details_path(request.parameters)
  end
end
