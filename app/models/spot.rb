class Spot < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :location
  has_many :review_spots, dependent: :destroy

  validates :name, :description, presence: true
  validates :name, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  multisearchable against: [:name, :description]

  has_many_attached :images
  has_one_attached :main_image

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
