class ConfigurationsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :new, :cerate, :destroy]

  def show
    @configuration = ::Configuration.find_by(product_id: params[:product_id])
  end

  def edit
    @configuration = @product.configuration
  end

  def update
    @configuration = ::Configuration.find_by(product_id: params[:product_id])

    @configuration.update!(product_id: params[:product_id],
                          screens: params[:screens],
                          backside_camera: params[:backside_camera],
                          front_camera: params[:front_camera],
                          cpu: params[:cpu],
                          gpu: params[:gpu],
                          battery_capacity: params[:battery_capacity],
                          sim: params[:sim],
                          operating_system: params[:operating_system],
                          made_by: params[:made_by],
                          released_time: params[:released_time])

    redirect_to manufacture_category_product_configuration_path(@product.manufacture, @product.category, @product)
  end

  def new
  end

  def create
    ::Configuration.create!(product_id: params[:product_id],
                          screens: params[:screens],
                          backside_camera: params[:backside_camera],
                          front_camera: params[:front_camera],
                          cpu: params[:cpu],
                          gpu: params[:gpu],
                          battery_capacity: params[:battery_capacity],
                          sim: params[:sim],
                          operating_system: params[:operating_system],
                          made_by: params[:made_by],
                          released_time: params[:released_time])

    redirect_to manufacture_category_product_configuration_path(@product.manufacture, @product.category, @product)
  end

  def destroy
    @configuration = ::Configuration.find_by(product_id: params[:product_id])
    @configuration.destroy

    redirect_to manufacture_category_products_path(@product.manufacture, @product.category)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
