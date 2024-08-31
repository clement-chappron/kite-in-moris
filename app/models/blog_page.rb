class BlogPage < ApplicationRecord
  belongs_to :user
  # validates :first_name, :last_name, :profile_picture, presence: true
end
