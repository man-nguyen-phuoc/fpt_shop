class HomesController < ApplicationController
  before_action :init_order, only: :search
  def index
    @categories = Category.all.limit(12)
    @products = Product.order(sell_number: :desc).limit(4)

    @sale_products = Category.first.products.limit(8)

    @sale_2_products = Category.find(2).products.limit(8)

    @sale_3_products = Category.find(3).products.limit(4)

    @accessories = Accessory.all.limit(16)
  end

  def search
    @products = Product.all
    @configurations = ::Configuration.all

    @products = @products.where(manufacture_id: params[:manufactures]) if params[:manufactures]

    @products = @products.joins(:configuration).where(configuration: { screens: params[:screens] }) if params[:screens]

    if params[:prices]

      sql_query = ''

      params[:prices].each do |price|
        price_arr = price.split('-')

        first = price_arr.first
        last = price_arr.last

        sql_query += ' OR ' if sql_query.present?

        first_query = "price >= #{first}" if first != '*'

        last_query = "price <= #{last}" if last != '*'

        and_query = 'AND' if first != '*' && last != '*'

        sql_query += "(#{first_query} #{and_query} #{last_query})"
      end

      @products = @products.where(sql_query)
    end

    if params[:key].present?
      @products = @products.includes(:manufacture, :category).where('LOWER(name) LIKE LOWER(?)', "%#{params[:key]}%")
    end

    @products = @products.order("price #{params[:price_order]}")

    @products = @products.page(params[:page]).per(9)

    @manufactures = Manufacture.all
  end

  private

  def init_order
    [:discount_order, :price_order, :name_order].each do |order_by|
      params[order_by] ||= 'desc'
    end
  end
end
