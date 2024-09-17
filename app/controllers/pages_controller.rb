class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :filter_categories ]

  def home
    @locations = Location.all
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
      @cards = []
      @results.each do |result|
        i = result.searchable.class.find(result.searchable.id)
        @cards << i
      end
    end
  end

  def filter_categories
    @category = params[:category]
    @location = params[:location]
    query = params[:query]

    if query.present?
      @cards = case @category
                when 'all'
                  [School.all, Shop.all, Spot.all].flatten.where("name ILIKE ?", "%#{query}%")
                when 'schools'
                  School.all.where("name ILIKE ?", "%#{query}%")
                when 'shops'
                  Shop.all.where("name ILIKE ?", "%#{query}%")
                when 'spots'
                  Spot.all.where("name ILIKE ?", "%#{query}%")
                else
                []
                end

    else
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
    end

    # Apply location filter if necessary
    if @location.present? && @location != 'all locations'
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
