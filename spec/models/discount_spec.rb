require "rails_helper"

RSpec.describe Discount, type: :model do
  it{ is_expected.to validate_presence_of(:quantity) }
  it{ is_expected.to validate_presence_of(:percentage) }
  it{ is_expected.to validate_numericality_of(:quantity).only_integer.is_greater_than(0) }
  it{ is_expected.to validate_numericality_of(:percentage).is_greater_than(0) }
  it{ is_expected.to belong_to(:item) }

  describe "#uniqueness" do
    let!(:discount){ create :discount }

    it{ is_expected.to validate_uniqueness_of(:item_id).scoped_to(:quantity, :percentage) }
  end
end
