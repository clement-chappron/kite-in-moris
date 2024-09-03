class Shop < ApplicationRecord
  belongs_to :location
  belongs_to :user

  has_many :reviews, as: :shop_school, dependent: :destroy
end
