FactoryBot.define do
  factory :product do
    manufacture
    category
    name { Faker::Name.name }
    quantity { Faker::Number.number(digits: 3) }
    price { Faker::Number.number(digits: 5) }
    thumbnail { Faker::Avatar.image }
    created_at { DateTime.now }
    updated_at { DateTime.now }
    sell_number { Faker::Number.number(digits: 2) }
    discount { rand(0..90) }
    feature { Faker::Markdown.emphasis }
  end
end
