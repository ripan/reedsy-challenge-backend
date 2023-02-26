require 'rails_helper'

RSpec.describe Item, type: :model do
  it{ is_expected.to validate_presence_of(:code) }
  it{ is_expected.to validate_presence_of(:name) }
  it{ is_expected.to validate_presence_of(:price) }
  it{ is_expected.to have_many(:discounts) }

  describe "#uniqueness" do
    let!(:item){ create :item }

    it{ is_expected.to validate_uniqueness_of(:code) }
  end

  describe "#total_price" do
    let!(:item){ create :item, code: "MUG", price: 6.00 }

    it "calculates total price" do
      expect(item.total_price(quantity: 5)).to eq(30)
      expect(item.total_price(quantity: 10)).to eq(60)
      expect(item.total_price(quantity: 1)).to eq(6)
    end
  end

  describe "#total_discount" do
    let(:discount){ build :discount, quantity: 3, percentage: 30 }
    let(:item){ create :item, code: "MUG", price: 6.00, discounts: [discount] }

    it "calculates total discount" do
      expect(item.total_discount(quantity: 1)).to eq(0)
      expect(item.total_discount(quantity: 3)).to eq(5.4)
      expect(item.total_discount(quantity: 10)).to eq(18)
    end
  end
end
