class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.date :date
      t.string :external_id

      t.timestamps
    end
  end
end
