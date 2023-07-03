module Accessories
  class ShowFacade
    def initialize(accessory_id, category_id, page)
      @accessory_id = product_id
      @category_id = category_id
      @page = page
    end

    def accessory
      Product.find(@accessory_id)
    end

    def category
      Category.find(@category_id)
    end

    def accessories
      category.accessories.page(@page).per(8) 
    end
  end
end