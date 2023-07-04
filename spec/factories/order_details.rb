FactoryBot.define do
  factory :order_detail do
    total_price { 0 }
    coupon
  end
end
