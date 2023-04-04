# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
manufactures = []

20.times do
  manufactures << Manufacture.new(name: Faker::Name.name)
end

Manufacture.import manufactures

Manufacture.all.each do |manufacture|
  categories = []

  40.times do
    categories << manufacture.categories.build(name: Faker::Name.name)
  end

  Category.import categories

  Category.all.each do |category|
    accessories = []

    40.times do
      accessories << Accessory.new(
        category_id: category.id,
        manufacture_id: manufacture.id,
        name: Faker::Name.name,
        price: rand(1000000..10000000),
        quantity: rand(100..500),
        thumnail: Faker::LoremFlickr.image
      )
    end

    Accessory.import accessories

    products = []

    40.times do
      products << Product.new(
        category_id: category.id,
        manufacture_id: manufacture.id,
        name: Faker::Name.name,
        price: rand(100000..15000000),
        quantity: rand(100..500),
        thumnail: Faker::LoremFlickr.image
      )
    end

    Product.import products
  end
end
