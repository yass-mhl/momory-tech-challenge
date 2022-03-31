class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products

  validates :external_id, presence: true
  validates :external_id, uniqueness: true
  validates :date, presence: true

  def total_price
    total_price = 0
    order_products.each do |product|
      total_price += product.unit_price * product.quantity
    end
    return total_price
  end
end
