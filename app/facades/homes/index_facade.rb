module Homes
  class IndexFacade
    def products_itemable_1
      Category.first.products.where('quantity > 0').limit(8)
    end

    def products_itemable_2
      Category.find(2).products.where('quantity > 0').limit(8)
    end

    def products_itemable_3
      Category.find(3).products.where('quantity > 0').limit(4)
    end

    def products_top_sell
      Product.where('quantity > 0').order(sell_number: :desc).limit(4)
    end

    def categories_of_prodcut
      Category.limit(12).product
    end

    def categories_of_accessory
      Category.limit(14).accessory
    end
  end
end