class Spot < ApplicationRecord
  belongs_to :location
  has_many :review_spots, dependent: :destroy

  validates :name, :description, presence: true
  validates :name, uniqueness: true
  
  has_many_attached :images
end
