class HomesController < ApplicationController
  def index
    @categories = Category.all.limit(12)
    @products = Product.order(sell_number: :desc).limit(4)

    @sale_products = Category.first.products.limit(8)

    @sale_2_products = Category.find(2).products.limit(8)

    @sale_3_products = Category.find(3).products.limit(4)

    @accessories = Accessory.all.limit(16)
  end
end
