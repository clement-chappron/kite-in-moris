class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[show]


  def new
    @shop = Shop.new
  end

  # def create
  #   @shop = Shop.new(shop_params)
  #   if @shop.save
  #     redirect_to @shop, notice: 'Shop was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  def create_step1
    @shop = Shop.new(shop_params_step1)
    if @shop.save
      redirect_to new_shop_path(@shop)
    else
      render :new
    end
  end

  def create_step2
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params_step2)
      redirect_to @shop, notice: 'Shop was successfully created.'
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @review_shop = ReviewShop.new
    @reviews_shop = @shop.review_shops

    @average_rating = @reviews_shop.average(:rating).to_f.round(1)
    @total_review_shop = @reviews_shop.count

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

  def shop_params_step1
    params.require(:shop).permit(:name, :address, :phone, :email, :facebook, :website, :user_id)
  end

  def shop_params_step2
    params.require(:shop).permit(:description, :instagram, :location_id)
  end

  def shop_params
    params.require(:shop).permit(:name, :address, :phone, :website, :description, :email, :facebook, :instagram, :location_id, :user_id, images: [])
  end
end
