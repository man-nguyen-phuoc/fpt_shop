class HomesController < ApplicationController
  before_action :init_order, only: [:search]

  def index
    @index_facade = Homes::IndexFacade.new()
  end

  def search
    search_options = {
      manufacture_id: params[:manufactures],
      prices: params[:prices],
      key: params[:key],
      screens: params[:screens]
    }

    @search_facade = Homes::SearchFacade.new(params[:page], params[:price_order], search_options: search_options)
  end

  private

  def init_order
    [:discount_order, :price_order, :name_order].each do |order_by|
      params[order_by] ||= 'desc'
    end
  end
end
