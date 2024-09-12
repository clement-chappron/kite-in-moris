class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :filter_categories ]

  def home
    @locations = Location.all
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
      @search_cards = []
      @results.each do |result|
        i = result.searchable.class.find(result.searchable.id)
        @search_cards << i
      end
    end
  end

  def filter_categories
    @category = params[:category]
    @location = params[:location]

    @cards = case @category
             when 'all'
               [School.all, Shop.all, Spot.all].flatten
             when 'schools'
               School.all
             when 'shops'
               Shop.all
             when 'spots'
               Spot.all
             else
              []
             end

    # Apply location filter if necessary
    if @location.present? && @location != 'All locations'
      @cards = @cards.select { |card| card.location.name == @location }
    end

    limit = params[:limitLoad].to_i
    offset = params[:offset].to_i

    @cards = @cards.sort_by(&:name).drop(offset).first(limit)

    respond_to do |format|
      format.html { render partial: "pages/cards", locals: { cards: @cards } }
    end
  end
end
