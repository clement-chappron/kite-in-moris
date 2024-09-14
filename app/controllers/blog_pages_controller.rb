class BlogPagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @blog_pages = BlogPage.all
  end

  def show
    @blog_page = BlogPage.find(params[:id])
    @comment_blog = @blog_page.comment_blogs.new
    @comment_blogs = @blog_page.comment_blogs
  end

  def new
    @blog_page = BlogPage.new
  end

  def create
    @blog_page = BlogPage.new(blog_page_params)
    @blog_page.save
    redirect_to blog_pages_path(@blog_page)
  end

  def edit
    @blog_page = BlogPage.find(params[:id])
  end

  def update
    @blog_page = BlogPage.find(params[:id])
    @blog_page.update(blog_page_params)
    redirect_to blog_pages_path(@blog_page)
  end

  def destroy
    @blog_page = BlogPage.find(params[:id])
    @blog_page.destroy
    redirect_to blog_pages_path, status: :see_other
  end

  private

  def record_not_found
    flash[:alert] = "The blog page you were looking for could not be found."
    redirect_to root_path
  end

  def blog_page_params
    params.require(:blog_page).permit(:title, :content)
  end
end
