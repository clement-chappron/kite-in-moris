class ReviewShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new create]
  before_action :set_shop, only: %i[index new create]

  def index
    @review_shops = @shop.review_shops
  end

  def new
    @review_shop = ReviewShop.new
  end

  def create
    @review_shop = ReviewShop.new(review_shop_params)
    @review_shop.shop_id = params[:shop_id]
    @review_shop.user_id = current_user.id

    if @review_shop.save
      redirect_to shop_path(params[:shop_id])
    else
      render :new
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def review_shop_params
    params.require(:review_shop).permit(:rating, :description, :shop_id, :user_id)
  end
end
