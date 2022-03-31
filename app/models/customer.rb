class Customer < ApplicationRecord
  has_many :orders

  validates :country, presence: true
  validates :external_id, presence: true
  validates :external_id, uniqueness: true
end
