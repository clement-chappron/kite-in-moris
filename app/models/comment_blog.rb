class CommentBlog < ApplicationRecord
  belongs_to :blog_page

  validates :description, presence: true, length: { minimum: 5 }
end
