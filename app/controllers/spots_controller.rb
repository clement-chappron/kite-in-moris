class SpotsController < ApplicationController
  def show
    @spot = Spot.friendly.find(params[:slug])
    @review_spot = ReviewSpot.new
    @location = Location.find_by(id: @spot.location_id)

    @review_spots = @spot.review_spots.order(created_at: :desc).limit(5)

    # Vérifier s'il reste d'autres reviews à charger
    @more_reviews_exist = @spot.review_spots.count > 5

  end
end
