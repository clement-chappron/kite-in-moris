class LocationsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @locations = Location.all
  end
end
