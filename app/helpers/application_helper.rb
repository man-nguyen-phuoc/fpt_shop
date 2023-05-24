module ApplicationHelper
  def currency_to_number(currency)
    number_to_currency(currency, unit: "VND", separator: ".", delimiter: ",", format: "%n %u")
  end

  def detail_itemable(itemable)
    category = itemable.category

    case itemable.class.name
    when 'Product'
      category_product_path(category, itemable)
    when 'Accessory'
      category_accessory_path(category, itemable)
    end
  end
end
