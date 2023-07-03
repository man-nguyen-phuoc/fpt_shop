class AccessoriesController < ApplicationController
  def index
    @index_facade = Accessories::IndexFacade.new(params[:category_id], params[:page])
  end

  def show
    @show_facade = Accessories::ShowFacade.new(params[:id], params[:category_id], params[:page])
  end
end
