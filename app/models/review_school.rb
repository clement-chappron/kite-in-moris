class ReviewSchool < ApplicationRecord
  belongs_to :schools
  belongs_to :users

  validates :description, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }, numericality: { only_integer: true }
end
