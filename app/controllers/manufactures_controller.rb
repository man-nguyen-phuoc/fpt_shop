class ManufacturesController < ApplicationController
  before_action :set_manufacture, except: [:index, :new, :create]
  # http_basic_authenticate_with name: "rumby",
  #                              password: "123"

  def index
    @manufactures = Manufacture.all

    # redirect_to 'https://google.com', allow_other_host: true

    respond_to do |format|
      format.html
      format.xml { render xml: @manufactures }
      format.json { render json: @manufactures }
    end
  end

  def new
  end

  def create
    manufacture = Manufacture.new(name: params[:name])

    if manufacture.save
      flash.now[:success] = 'Manufacture have been created'
    else
      flash.now[:alert] = 'Manufacture not created yet'
    end

    redirect_to '/manufactures'
  end

  def edit
  end

  def update
    # raise Exceptions::CustomError, "Something went wrong"
    @manufacture.update!(name: params[:name])
    redirect_to '/manufactures'
  end

  def show
    # redirect_to '/manufactures/index'
    # session[:current_manufacture_id] = 'gsdgdgf'
  end

  def destroy
    @manufacture.destroy

    redirect_to '/manufactures'
  end

  private

  def manufactures_params
    params.require(:manufactures).permit(:name)
  end

  def set_manufacture
    @manufacture = Manufacture.find(params[:id])
  end

  # def authenticate
  #   authenticate_or_request_with_http_token do |token, _options|
  #     ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
  #   end
  # end
end
