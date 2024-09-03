class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    @review_spots = ReviewSpot.all
    @review_spot = ReviewSpot.new
    @location = Location.find_by(id: @spot.location_id)

  end
end
