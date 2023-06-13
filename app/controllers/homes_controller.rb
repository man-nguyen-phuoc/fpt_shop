class HomesController < ApplicationController
  before_action :init_order, only: :search

  def index
    @categories_0 = Category.limit(12).product

    @categories_1 = Category.limit(14).accessory

    @products = Product.order(sell_number: :desc).limit(4)

    @sale_products = Category.first.products.limit(8)

    @sale_2_products = Category.find(2).products.limit(8)

    @sale_3_products = Category.find(3).products.limit(4)
  end

  def search
    products = search_process(Product.select("*, 'Product' AS type").all)
    accessories = search_process(Accessory.select("*, 'Accessory' AS type").all)

    combined_query = "(#{products}) UNION (#{accessories})"

    @itemables = ActiveRecord::Base.connection.execute(combined_query)

    column_names = @itemables.fields
    @itemables = @itemables.map { |row| Hash[column_names.zip(row)] }

    @configurations = ::Configuration.all

    @itemables = @itemables.sort_by { |record| record['price'] }
    @itemables = @itemables.reverse if params[:price_order] == 'desc'

    @itemables = Kaminari.paginate_array(@itemables).page(params[:page]).per(9)

    @manufactures = Manufacture.all
  end

  def account

  end

  private

  def search_process(model)
    itemables = model.all
    itemables = model.where(manufacture_id: params[:manufactures]) if params[:manufactures]

    itemables = itemables.joins(:configuration).where(configuration: { screens: params[:screens] }) if params[:screens]

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

      itemables = itemables.where(sql_query)
    end

    if params[:key].present?
      itemables = itemables.includes(:manufacture, :category).where('LOWER(name) LIKE LOWER(?)', "%#{params[:key]}%")
    end

    itemables.to_sql
  end

  def init_order
    [:discount_order, :price_order, :name_order].each do |order_by|
      params[order_by] ||= 'desc'
    end
  end
end
