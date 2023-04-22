class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :show, :update, :destroy]
  before_action :set_manufacture, only: [:index, :new, :create, :show, :destroy, :edit, :update]

  def index
    @categories = Category.all.limit(50)
  end

  def new
  end

  def create
    @category = Category.create(name: params[:name])

    redirect_to manufacture_categories_path(@manufacture)
  end

  def edit
  end

  def update
    @category.update!(name: params[:name])
    redirect_to manufacture_category_path(@manufacture)
  end

  def show
  end

  #help
  def destroy
    @category.destroy
    redirect_to manufacture_categories_path(@manufacture)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def set_manufacture
    @manufacture = Manufacture.find(params[:manufacture_id])
  end
end
