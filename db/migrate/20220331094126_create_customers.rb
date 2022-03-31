class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :country
      t.string :external_id

      t.timestamps
    end
  end
end
