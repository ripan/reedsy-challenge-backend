class Discount < ApplicationRecord
  validates :quantity, :percentage, presence: true
  validates :item_id, uniqueness: { scope: %i[quantity percentage] }
  belongs_to :item
end
