class ProductsController < ApplicationController
  def index
    @index_facade = Products::IndexFacade.new(params[:category_id], params[:page])
  end

  def show
    @show_facade = Products::ShowFacade.new(params[:id], params[:category_id], params[:page])
  end
end
