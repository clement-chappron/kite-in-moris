class CreateBlogPages < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_pages do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
