# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

tshirt_discount_1 = FactoryBot.build :discount, quantity: 3, percentage: 30
mug_discount_1 = FactoryBot.build :discount, quantity: 10, percentage: 2
mug_discount_2 = FactoryBot.build :discount, quantity: 20, percentage: 4
mug_discount_3 = FactoryBot.build :discount, quantity: 30, percentage: 6
mug_discount_4 = FactoryBot.build :discount, quantity: 40, percentage: 8
mug_discount_5 = FactoryBot.build :discount, quantity: 50, percentage: 10
mug_discount_6 = FactoryBot.build :discount, quantity: 150, percentage: 30

FactoryBot.create :item, code: "MUG", price: 6.00, discounts: [
  mug_discount_1,
  mug_discount_2,
  mug_discount_3,
  mug_discount_4,
  mug_discount_5,
  mug_discount_6
]
FactoryBot.create :item, code: "TSHIRT", price: 15.00, discounts: [
  tshirt_discount_1
]
FactoryBot.create :item, code: "HOODIE", price: 20.00
