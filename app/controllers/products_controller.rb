class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :hide]
  # before_action :set_manufacture, only: [:index, :new, :create, :show, :destroy, :edit, :update]
  before_action :set_category, only: [:index, :new, :create, :show, :destroy, :edit, :update]

  def index
    @products = @category.products.page(params[:page]).per(8)
  end

  def new
  end

  def create
    Product.create(manufacture_id: params[:manufacture_id],
                  category_id: params[:category_id],
                  name: params[:name],
                  quantity: params[:quantity],
                  price: params[:price],
                  thumnail: params[:thumnail])

    redirect_to manufacture_category_products_path(@manufacture, @category)
  end

  def show
    @products = @category.products.page(params[:page]).per(8)
  end

  def edit
  end

  def update
    @product.update!(
                    manufacture_id: params[:manufacture_id],
                    category_id: params[:category_id],
                    name: params[:name],
                    quantity: params[:quantity],
                    price: params[:price],
                    thumnail: params[:thumnail]
                  )

    redirect_to manufacture_category_product_path(@manufacture, @category, @product)
  end

  def destroy
    @product.destroy
    redirect_to manufacture_category_products_path(@manufacture, @category)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_manufacture
    @manufacture = Manufacture.find(params[:manufacture_id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
