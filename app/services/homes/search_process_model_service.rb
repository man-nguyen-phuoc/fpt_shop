module Homes
  class SearchProcessModelService
    def initialize(model, search_options: {})
      @model = model
      @search_options = search_options
    end

    def call
      itemables = @model

      itemables = @model.where(manufacture_id: @search_options[:manufacture_id]) if @search_options[:manufacture_id]

      itemables = itemables.joins(:configuration).where(configuration: { screens: @search_options[:screens] }) if @search_options[:screens]

      if @search_options[:prices]
        itemables = search_with_price(@search_options[:prices], itemables)
      end

      if @search_options[:key].present?
        itemables = search_with_key(@search_options[:key], itemables)
      end
  
      itemables.to_sql
    end

    private

    def search_with_price(prices, itemables)
      sql_query = ''

      prices.each do |price|
        price_arr = price.split('-')

        first = price_arr.first
        last = price_arr.last

        sql_query += ' OR ' if sql_query.present?

        first_query = "price >= #{first}" if first != '*'

        last_query = "price <= #{last}" if last != '*'

        and_query = 'AND' if first != '*' && last != '*'

        sql_query += "(#{first_query} #{and_query} #{last_query})"
      end

      itemables.where(sql_query)
    end

    def search_with_key(key, itemables)
      itemables.includes(:manufacture, :category).where('LOWER(name) LIKE LOWER(?)', "%#{key}%")
    end
  end
end