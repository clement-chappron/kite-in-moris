class CommentBlog < ApplicationRecord
  belongs_to :blog_page
  belongs_to :user

  validates :description, presence: true, length: { minimum: 5 }
end
