class SpotsController < ApplicationController
  def show
    @spot = Spot.friendly.find(params[:slug])
    @review_spots = ReviewSpot.all
    @review_spot = ReviewSpot.new
    @location = Location.find_by(id: @spot.location_id)

  end
end
