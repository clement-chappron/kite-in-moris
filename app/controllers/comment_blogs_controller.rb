class CommentBlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new create]
  before_action :set_blog_page, only: %i[index new create]

  def index
    @comment_blogs = @blog_page.comment_blogs
  end

  def new
    @comment_blog = CommentBlog.new
  end
  def create
    @comment_blog = CommentBlog.new(comment_blog_params)
    @comment_blog.blog_page_id = params[:blog_page_id]
    @comment_blog.user_id = current_user.id
    if @comment_blog.save
      redirect_to blog_page_path(@comment_blog.blog_page_id)
    else
      render :new
    end
  end

  private

  def set_blog_page
    @blog_page = BlogPage.find(params[:blog_page_id])
  end

  def comment_blog_params
    params.require(:comment_blog).permit(:description)
  end
end
