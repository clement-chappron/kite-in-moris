class Spot < ApplicationRecord
  belongs_to :locations
  has_many :review_spots, dependent: :destroy
end
