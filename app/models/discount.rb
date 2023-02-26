class Discount < ApplicationRecord
  validates :quantity, :percentage, presence: true
  validates :item_id, uniqueness: { scope: %i[quantity percentage] }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :percentage, numericality: { only_integer: false, greater_than: 0 }
  belongs_to :item
end
