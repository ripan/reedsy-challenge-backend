require 'rails_helper'

RSpec.describe Item, type: :model do
  it{ is_expected.to validate_presence_of(:code) }
  it{ is_expected.to validate_presence_of(:name) }
  it{ is_expected.to validate_presence_of(:price) }
  it{ is_expected.to validate_numericality_of(:price).is_greater_than(0) }
  it{ is_expected.to have_many(:discounts) }

  describe "#uniqueness" do
    let!(:item){ create :item }

    it{ is_expected.to validate_uniqueness_of(:code) }
  end

  describe "#total_price" do
    let!(:item){ create :item, code: "MUG", price: 6.00 }

    it "calculates total price" do
      expect(item.total_discount(quantity: 1)).to eq(0)
      expect(item.total_discount(quantity: 2)).to eq(0)
      expect(item.total_discount(quantity: 3)).to eq(0)
      expect(item.total_discount(quantity: 4)).to eq(0)
      expect(item.total_discount(quantity: 29)).to eq(0)
      expect(item.total_discount(quantity: 30)).to eq(0)
      expect(item.total_discount(quantity: 31)).to eq(0)
    end
  end

  describe "#total_discount" do
    let(:discount_1){ build :discount, quantity: 3, percentage: 30 }
    let(:discount_2){ build :discount, quantity: 30, percentage: 60 }
    let(:item){ create :item, code: "MUG", price: 6.00, discounts: [discount_1, discount_2] }

    it "calculates total discount" do
      expect(item.total_discount(quantity: 1)).to eq(0)
      expect(item.total_discount(quantity: 2)).to eq(0)
      expect(item.total_discount(quantity: 3)).to eq(5.4)
      expect(item.total_discount(quantity: 4)).to eq(7.2)
      expect(item.total_discount(quantity: 29)).to eq(52.2)
      expect(item.total_discount(quantity: 30)).to eq(108)
      expect(item.total_discount(quantity: 31)).to eq(111.6)
    end
  end
end
