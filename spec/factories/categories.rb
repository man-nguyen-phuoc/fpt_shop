FactoryBot.define do
  factory :category do
    name { Faker::Name.name }
    thumbnail { Faker::Avatar.image }
    category_type { rand(0..1) }
  end
end
