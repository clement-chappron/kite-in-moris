class ReviewShop < ApplicationRecord
  belongs_to :shop
  belongs_to :user

  validates :description, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }, numericality: { only_integer: true }
end
