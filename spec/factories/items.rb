FactoryBot.define do
  factory :item do
    code{ FFaker::IdentificationTW.id }
    name{ FFaker::Product.product_name }
    price{ FFaker::Number.decimal }
  end
end
