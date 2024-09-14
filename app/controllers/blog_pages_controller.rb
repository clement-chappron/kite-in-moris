class BlogPagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :authorize_user!, only: [:edit, :update]

  def index
    @blog_pages = BlogPage.all
  end

  def show
    @blog_page = BlogPage.find(params[:id])
    @comment_blog = @blog_page.comment_blogs.new
    @comment_blogs = @blog_page.comment_blogs
  end

  def edit
    @blog_page = BlogPage.find(params[:id])
  end

  def update
    @blog_page = BlogPage.find(params[:id])
    if blog_page_params[:blog_picture]
      @blog_page.blog_picture.attach(blog_page_params[:blog_picture])
    end
    if @blog_page.update(blog_page_params.except(:blog_picture))
      redirect_to @blog_page, notice: "Blog page updated successfully!"
    else
      render :edit
    end
  end

  private

  def authorize_user!
    redirect_to root_path, alert: 'Not authorized' unless @blog_page.user == current_user
  end

  def record_not_found
    flash[:alert] = "The blog page you were looking for could not be found."
    redirect_to root_path
  end

  def blog_page_params
    params.require(:blog_page).permit(:title, :content, :user_id, :blog_picture)
  end
end
