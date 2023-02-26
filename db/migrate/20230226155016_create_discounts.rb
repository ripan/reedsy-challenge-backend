class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.decimal :percentage, null: false

      t.timestamps
    end
  end
end
