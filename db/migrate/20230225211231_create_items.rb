class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
    add_index :items, %i[code name], unique: true
  end
end
