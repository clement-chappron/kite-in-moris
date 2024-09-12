class SearchController < ApplicationController
  def search
    @query = params[:query]

    # Search for schools, shops, and spots based on your models
    @schools = School.search(@query)
    @shops = Shop.search(@query)
    @spots = Spot.search(@query)

    # Combine the results and paginate if necessary
    @results = @schools + @shops + @spots
  end
end
