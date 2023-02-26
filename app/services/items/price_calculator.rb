class Items::PriceCalculator < ApplicationService
  attr_reader :items

  def initialize(items: [])
    @items = items
  end

  def call
    items.sum do |item|
      quantity = item[:quantity]
      item = Item.find_by!(code: item[:code])
      item.total_price(quantity: quantity).to_f
    end
  end
end
