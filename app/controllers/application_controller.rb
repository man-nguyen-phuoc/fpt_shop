class ApplicationController < ActionController::Base
  # rescue_from NameError, with: :name_error_handle
  # # rescue_from Exceptions::CustomError, with: :handle_custom_error
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # rescue_from ActiveRecord::RecordInvalid, with: :record_not_valid

  # def current_manufacture
  #   @current_manufacture ||= Manufacture.find_by(id: session[:current_manufacture_id])
  # end

  # private

  # def name_error_handle
  #   redirect_to '/manufactures/1/show'
  # end

  # def record_not_found
  #   redirect_to '/manufactures/index'
  # end

  # def record_not_valid
  #   redirect_to '/manufactures/edit'
  # end

  # def handle_custom_error(error)
  #   flash[:error] = error.message
  #   render_404
  # end

  # def render_404
  #   render file: "#{Rails.root}/public/404.html", status: :not_found
  # end
end
