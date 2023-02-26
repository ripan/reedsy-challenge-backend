class Item < ApplicationRecord
  validates :code, :name, :price, presence: true
  validates :code, uniqueness: { scope: :name }
  validates :price, numericality: { only_integer: false, greater_than: 0 }

  def total_price(quantity:)
    price * quantity
  end
end
