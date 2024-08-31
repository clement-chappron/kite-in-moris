class School < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_many :reviews, dependent: :destroy, as: :reviewable
end
