class CommentBlog < ApplicationRecord
  belongs_to :blog_pages

  validates :description, presence: true, length: { minimum: 20 }
end
