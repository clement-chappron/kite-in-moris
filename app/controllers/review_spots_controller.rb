class ReviewSpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new create]
  before_action :set_spot, only: %i[index new create]

  def index
    @review_spots = @spot.review_spots
  end

  def new
    @review_spot = ReviewSpot.new
  end

  def create
    @review_spot = ReviewSpot.new(review_spot_params)
    @review_spot.spot_id = params[:spot_id]
    @review_spot.user_id = current_user.id

    if @review_spot.save
      redirect_to spot_path(params[:spot_id])
    else
      render :new
    end
  end

  private

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end

  def review_spot_params
    params.require(:review_spot).permit(:rating, :description, :spot_id, :user_id)
  end
end
