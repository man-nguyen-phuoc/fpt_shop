module Homes
  class SearchFacade
    def initialize(page, price_order, search_options: {})
      @page = page
      @price_order = price_order
      @search_options = search_options
    end
      
    def all_configurations
      ::Configuration.all
    end

    def all_manufactures
      Manufacture.all
    end

    def all_itemables
      products = Homes::SearchProcessModelService.new(Product.select("*, 'Product' AS type").all, search_options: @search_options).call

      accessories = Homes::SearchProcessModelService.new(Accessory.select("*, 'Accessory' AS type").all, search_options: @search_options).call

      combined_query = "(#{products}) UNION (#{accessories})"
  
      @itemables = ActiveRecord::Base.connection.execute(combined_query)
  
      column_names = @itemables.fields
      @itemables = @itemables.map { |row| Hash[column_names.zip(row)] }
  
      @itemables = @itemables.sort_by { |record| record['price'] }
      @itemables = @itemables.reverse if @price_order == 'desc'
      
      @itemables = Kaminari.paginate_array(@itemables).page(@page).per(9)
    end
  end
end