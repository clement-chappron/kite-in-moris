class BlogPage < ApplicationRecord
  belongs_to :user
  has_many :comment_blogs, dependent: :destroy
  has_one_attached :blog_picture
  validates :title, :content, :user_id, presence: true
end
