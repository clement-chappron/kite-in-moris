class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[show]


  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to @shop, notice: 'Shop was successfully created.'
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @review_shop = ReviewShop.new

    @review_shops = @shop.review_shops.order(created_at: :desc).limit(5)
  end

  def edit
  end

  def update
    if shop_params[:images]
      @shop.images.attach(shop_params[:images])
    end
    if @shop.update(shop_params.except(:images))
      redirect_to @shop, notice: "Shop updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_url, notice: 'Shop was successfully destroyed.'
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :address, :phone, :website, :description, :email, :facebook, :instagram, :location_id, :user_id, images: [])
  end
end
