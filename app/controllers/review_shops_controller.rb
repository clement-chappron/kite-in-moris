class ReviewShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new create]
  before_action :set_shop, only: %i[index new create show]


  def index
    @review_shops = @shop.review_shops
  end

  def show
    @review_shop = ReviewShop.new
    @location = Location.find_by(id: @shop.location_id)
    @review_shop.user = current_user

    @review_shops = @shop.review_shops.order(created_at: :desc).limit(5)
    @more_reviews_exist = @shop.review_shops.count > 5
  end

  def new
    @review_shop = ReviewShop.new
  end

  def create
    @review_shop = ReviewShop.new(review_shop_params)
    @review_shop.shop_id = params[:shop_id]
    @review_shop.user_id = current_user.id

    if @review_shop.save
      redirect_to shop_path(@review_shop.shop_id)
    else
      render :new
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id] || params[:id])
  end

  def review_shop_params
    params.require(:review_shop).permit(:rating, :description, :shop_id, :user_id)
  end
end
