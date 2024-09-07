class Spot < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :location
  has_many :review_spots, dependent: :destroy

  validates :name, :description, presence: true
  validates :name, uniqueness: true

  has_many_attached :images

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
