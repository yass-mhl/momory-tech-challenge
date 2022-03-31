# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts "Destroy order products"

OrderProduct.delete_all

puts "Destroy orders"

Order.delete_all

puts "Destroy customers"

Customer.delete_all

customers = []
orders = []
order_products = []
customer_ids = []
order_ids = []

puts "------------------------------------------------"
puts "Start parsing CSV"

# You can change the filepath to 'db/ressources/memory-tech-challenge-data.csv' for have the entire CSV file
# The seed takes too long time and heroku's ram doesn't love that.... so i cut the for the seed, sorry..
# But this seed works for the original file !
filepath = 'db/ressources/seed-memory-tech-challenge-data.csv'

CSV.foreach(filepath, col_sep: ',', quote_char: '"', headers: :first_row) do |row|
  unless customer_ids.include?(row['customer_id'])
    customers << Customer.create({ external_id: row['customer_id'], country: row['country'] })
    puts "Customer was create"
    customer_ids << row['customer_id']
  end

  unless order_ids.include?(row['order_id'])
    orders << Order.create({ date: row['date'].to_date, external_id: row['order_id'], customer: customers.last })
    puts 'Order was create'
    order_ids << row['order_id']
  end

  order_products << OrderProduct.create({ quantity: row['quantity'].to_i, product_code: row['product_code'], product_description: row['product_description'], unit_price: row['unit_price'].to_f, order: orders.last })
  puts "Order_products was create"
end
