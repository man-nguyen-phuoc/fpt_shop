module Products
  class ShowFacade
    def initialize(product_id, category_id, page)
      @product_id = product_id
      @category_id = category_id
      @page = page
    end

    def product
      Product.find(@product_id)
    end

    def category
      Category.find(@category_id)
    end

    def products
      category.products.page(@page).per(8)
    end
  end
end