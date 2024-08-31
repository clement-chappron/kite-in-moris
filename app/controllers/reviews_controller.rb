class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
    @school = School.find(params[:school_id]) if params[:school_id].present?
    @shop = Shop.find(params[:shop_id]) if params[:shop_id].present?
  end

  def create
    @review = Review.new(review_params)

    if params[:school_id].present?
      @review.school = School.find(params[:school_id])
    elsif params[:shop_id].present?
      @review.shop = Shop.find(params[:shop_id])
    else
      raise "Invalid shop or school"
    end

    if @review.save
      redirect_to @review.reviewable, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review.reviewable, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @review.reviewable, notice: 'Review was successfully destroyed.'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :school_id, :shop_id)
  end
end
