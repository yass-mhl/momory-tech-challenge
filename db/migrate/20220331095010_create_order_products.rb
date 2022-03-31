class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.integer :quantity
      t.decimal :unit_price
      t.string :product_code
      t.string :product_description
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
