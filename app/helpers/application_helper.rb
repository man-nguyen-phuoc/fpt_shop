module ApplicationHelper
  def currency_to_number(currency)
    number_to_currency(currency, unit: "VND", separator: ".", delimiter: ",", format: "%n %u")
  end
end
