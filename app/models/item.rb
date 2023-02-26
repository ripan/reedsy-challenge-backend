class Item < ApplicationRecord
  validates :code, :name, :price, presence: true
  validates :code, uniqueness: true
  validates :price, numericality: { only_integer: false, greater_than: 0 }

  has_many :discounts, dependent: :delete_all

  def total_price(quantity:)
    price * quantity
  end

  def total_discount(quantity:)
    return 0 if discounts.blank?

    total = 0
    discounts.each do |discount|
      if quantity >= discount.quantity
        total = total_price(quantity: quantity) * (discount.percentage / 100)
      end
    end
    total
  end
end
