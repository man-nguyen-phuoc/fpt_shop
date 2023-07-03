class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shipping_address, only: [:edit, :show]

  def update
    Users::UpdateCurrentUserService.new(current_user, user_params).call
    Users::FindOrInitializeShippingAddressService.new(shipping_address_params, current_user).call

    redirect_to user_path(current_user)
  end

  
  private
  
  def user_params
    params.require(:user).permit(:avatar, :name, :email, :area_code, :phone_number)
  end

  def shipping_address_params
    params.require(:shipping_address).permit(:receiver_name, :receiver_phone_number, :city, :district, :address)
  end

  def set_shipping_address
    @shipping_address = current_user.shipping_address
  end

end
