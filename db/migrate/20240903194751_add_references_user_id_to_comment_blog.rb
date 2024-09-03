class AddReferencesUserIdToCommentBlog < ActiveRecord::Migration[7.1]
  def change
    add_reference :comment_blogs, :user, null: false, foreign_key: true
  end
end
