class Spot < ApplicationRecord
  belongs_to :location
  has_many :review_spots, dependent: :destroy
end
