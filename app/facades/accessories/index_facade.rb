module Accessories
  class IndexFacade
    def initialize(category_id, page)
      @category_id = category_id
      @page = page
    end

    def category
      Category.find(@category_id)
    end

    def accessories
      category.products.page(@page).per(8)
    end
  end
end