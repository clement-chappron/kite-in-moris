class Shop < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :review_shops, dependent: :destroy

end
