class BlogPage < ApplicationRecord
  belongs_to :user
  has_one_attached :blog_picture
  validates :title, :content, :user_id, presence: true
end
