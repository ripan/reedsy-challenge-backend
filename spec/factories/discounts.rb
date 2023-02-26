FactoryBot.define do
  factory :discount do
    item
    quantity{ rand(1..100) }
    percentage{ FFaker::Number.decimal }
  end
end
