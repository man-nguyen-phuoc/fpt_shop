class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
    @shipping_address = @user.shipping_address
  end

  def update
    current_user.update(user_params)

    shipping_address = ShippingAddress.find_or_initialize_by(user_id: current_user.id)
    shipping_address.assign_attributes(shipping_address_params)
    shipping_address.save!

    redirect_to user_path(current_user)
  end

  def show
    @user = current_user
    @shipping_address = current_user.shipping_address
  end

  def user_params
    params.require(:user).permit(:avatar, :name, :email, :area_code, :phone_number)
  end

  def shipping_address_params
    params.require(:shipping_address).permit(:receiver_name, :receiver_phone_number, :city, :district, :address)
  end
end
