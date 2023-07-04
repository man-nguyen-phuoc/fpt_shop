FactoryBot.define do
  factory :coupon do
    code { Faker::Code.nric }
    discount { rand(1..30) }
    quantity { rand(10..50) }
    price { rand(200000..1000000)}
  end
end
