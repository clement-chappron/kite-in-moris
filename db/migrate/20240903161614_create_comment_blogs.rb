class CreateCommentBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :comment_blogs do |t|
      t.text :description
      t.references :blog_pages, null: false, foreign_key: true

      t.timestamps
    end
  end
end
