class AccessoriesController < ApplicationController
  before_action :set_accessory, only: [:show, :edit, :update, :destroy]
  before_action :set_manufacture, only: [:index, :new, :create, :show, :destroy, :edit, :update]
  before_action :set_category, only: [:index, :new, :create]

  def index
    @accessories = @category.accessories.limit(200)
  end

  def new
  end

  def create
    @accessory = Accessory.create!(manufacture_id: params[:manufacture_id],
                                  category_id: params[:category_id],
                                  name: params[:name],
                                  price: params[:price],
                                  quantity: params[:quantity],
                                  thumnail: params[:thumnail])

    redirect_to manufacture_category_accessory_path(@manufacture, @category, @accessory)
  end

  def show
  end

  def destroy
    @accessory.destroy

    redirect_to manufacture_category_accessories_path(@manufacture, @accessory.category)
  end

  def edit
  end

  def update
    @accessory.update!(manufacture_id: params[:manufacture_id],
                        category_id: params[:category_id],
                        name: params[:name],
                        price: params[:price],
                        quantity: params[:quantity],
                        thumnail: params[:thumnail])

    redirect_to manufacture_category_accessory_path(@manufacture, @accessory.category, @accessory)
  end

  private

  def set_accessory
    @accessory = Accessory.find(params[:id])
  end

  def set_manufacture
    @manufacture = Manufacture.find(params[:manufacture_id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
