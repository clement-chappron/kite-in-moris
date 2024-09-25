class Shop < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :review_shops, dependent: :destroy

  has_many_attached :images

  validates :name, :address, :phone, :website, :description, :email, :facebook, :instagram, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  include PgSearch::Model
  multisearchable against: [:name, :address, :description]
end
