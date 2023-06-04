5.times do
  Manufacture.create(name: Faker::Name.name)
end

Manufacture.all.each do |manufacture|
  5.times do
    manufacture.categories.create(name: Faker::Name.name,
                                  thumbnail: Faker::Avatar.image,
                                  category_type: rand(0..1))
  end

  Category.all.each do |category|
    10.times do
      Accessory.create(
        category_id: category.id,
        manufacture_id: manufacture.id,
        name: Faker::Name.name,
        price: rand(1000000..10000000),
        quantity: rand(100..500),
        sell_number: rand(10..100),
        thumbnail: Faker::Avatar.image
      )
    end

    10.times do
      Product.create(
        category_id: category.id,
        manufacture_id: manufacture.id,
        name: Faker::Name.name,
        price: rand(100000..15000000),
        quantity: rand(100..500),
        thumbnail: Faker::Avatar.image,
        discount: rand(0..100),
        sell_number: rand(0..1000)
      )
    end
  end
end

Product.all.each do |product|
  Configuration.create(
    product_id: product.id,
    screens: Faker::Name.name,
    front_camera: Faker::Camera.model,
    backside_camera: Faker::Camera.brand,
    memory_in: Faker::Mountain.name,
    cpu: Faker::Code.nric,
    gpu: Faker::Code.nric,
    battery_capacity: rand(1000..5000),
    sim: Faker::Name.middle_name,
    operating_system: Faker::Name.middle_name,
    made_by: Faker::Company.name,
    released_time: Faker::Time.between_dates(from: Date.today - 4, to: Date.today, period: :all),
    ram: rand(200..400)
  )
end

Accessory.all.each do |accessory|
  ConfigurationAccessory.create(
    accessory_id: accessory.id,
    connect_type: Faker::Name.name,
    feature: Faker::Markdown.emphasis
  )
end

User.all.each do |user|
  ShippingAddress.create(
    user_id: user.id,
    city: Faker::Address.city,
    district: Faker::Name.name,
    address: Faker::Address.street_address,
    receiver_name: Faker::Name.name,
    receiver_phone_number: Faker::PhoneNumber.phone_number_with_country_code
  )
end


10.times do
  OrderDetail.create(
    total_price: rand(1000000..2000000)
  )
end

User.all.each do |user|
  Cart.create(
    total_price: 0,
    user_id: user.id
  )
end
