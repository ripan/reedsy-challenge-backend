class Items::PriceCalculator < ApplicationService
  attr_reader :items

  def initialize(items: [])
    @items = items
  end

  def call
    {
      total_price: total_price,
      total_discount: total_discount,
      total: total
    }
  end

  private

  def total
    total_price - total_discount
  end

  def total_price
    items.sum do |item|
      quantity = item[:quantity]
      item = Item.find_by!(code: item[:code])
      item.total_price(quantity: quantity).to_f
    end
  end

  def total_discount
    items.sum do |item|
      quantity = item[:quantity]
      item = Item.find_by!(code: item[:code])
      item.total_discount(quantity: quantity).to_f
    end
  end
end
