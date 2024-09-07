class ReviewSpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :set_spot, only: %i[new create]


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


  def load_more
    @spot = Spot.friendly.find(params[:spot_slug])

    # Charge toutes les reviews du spot en question, triées par date
    all_reviews = @spot.review_spots.order(created_at: :desc)

    # Applique l'offset et la limite pour la pagination
    @review_spots = all_reviews.drop(params[:offset].to_i).first(params[:limitLoad].to_i)

    # Vérifie s'il reste des reviews à charger après cette requête
    more_reviews_exist = all_reviews.size > (params[:offset].to_i + @review_spots.size)

    respond_to do |format|
      format.html { render partial: "spots/review_spots", locals: { review_spots: @review_spots, more_reviews_exist: @more_reviews_exist } }
    end
  end

  private

  def set_spot
    @spot = Spot.find(params[:spot_slug])
  end


  def review_spot_params
    params.require(:review_spot).permit(:rating, :description, :spot_id, :user_id)
  end
end
