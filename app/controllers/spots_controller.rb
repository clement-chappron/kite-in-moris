class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @spot = Spot.friendly.find(params[:slug])
    @review_spot = ReviewSpot.new
    @location = Location.find_by(id: @spot.location_id)

    @review_spots = @spot.review_spots.order(created_at: :desc).limit(5)

    # Vérifier s'il reste d'autres reviews à charger
    @more_reviews_exist = @spot.review_spots.count > 5

    #Get the spot's coordinates
    @markers = [
      {
        lat: @spot.latitude,
        lng: @spot.longitude
      }
    ]

    # Access the initialized openweatherAPI
    open_weather_api = Rails.configuration.open_weather_api

    # Fetch weather data using the spot's address
    weather_data = open_weather_api.current(lon: @spot.longitude, lat: @spot.latitude)


    if weather_data && weather_data['main']
      @weather = weather_data['main']
      @weather['temp'] = @weather['temp'] - 273.15  # Convert from Kelvin to Celsius
      @weather['description'] = weather_data['weather'][0]['description']  # Get the weather description
      wind_speed_mps = weather_data['wind']['speed']  # Wind speed in m/s
      @weather['speed_knots'] = (wind_speed_mps * 1.94384).round(1)  # Convert to knots and round to 2 decimal places
      @weather['deg'] = weather_data['wind']['deg']  # Get wind direction
      @weather['gust'] = weather_data['wind']['gust']  # Get wind gust
      @weather['icon'] = weather_data['weather'][0]['icon']  # Get the weather icon
      @weather['icon_url'] = "http://openweathermap.org/img/w/#{@weather['icon']}.png"
      @weather['humidity'] = weather_data['main']['humidity']  # Get humidity
      @weather['pressure'] = weather_data['main']['pressure']  # Get pressure
    else
      @weather = nil  # Handle errors accordingly
    end
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
