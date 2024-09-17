class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @spot = Spot.friendly.find(params[:slug])
    @review_spot = ReviewSpot.new
    @location = Location.find_by(id: @spot.location_id)

    @review_spots = @spot.review_spots.order(created_at: :desc).limit(5)

    # Vérifier s'il reste d'autres reviews à charger
    @more_reviews_exist = @spot.review_spots.count > 5
  end


  def edit
    @spot = Spot.friendly.find(params[:slug])
  end

  def update
    @spot = Spot.friendly.find(params[:slug])
    if spot_params[:images]
      @spot.images.attach(spot_params[:images])
    end
    if @spot.update(spot_params.except(:images))
      redirect_to @spot, notice: "Spot updated successfully!"
    else
      render :edit
    end
  end


  private

  def spot_params
    params.require(:spot).permit(images: [])
  end
end
