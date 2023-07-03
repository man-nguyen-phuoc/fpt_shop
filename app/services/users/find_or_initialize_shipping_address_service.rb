module Users
  class FindOrInitializeShippingAddressService
    def initialize(shipping_address_params, current_user)
      @shipping_address_params = shipping_address_params
      @current_user = current_user
    end

    def call
      find_or_initialize_shipping_address(@shipping_address_params)
    end

    private

    def find_or_initialize_shipping_address(shipping_address_params)
      if shipping_address_params
        shipping_address = ShippingAddress.find_or_initialize_by(user_id: @current_user.id)
        shipping_address.assign_attributes(shipping_address_params)
        shipping_address.save!
      end
    end
  end  
end