FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    phone_number { 387138683 }
    area_code { 84 }
    email { 'mannguyenta@gmail.com' }
  end
end
