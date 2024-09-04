class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :filter_categories ]

  def home
    @locations = Location.all
  end

  def filter_categories
    @category = params[:category]

    @cards = case @category
             when 'all'
               [School.all, Shop.all, Spot.all].flatten.sort_by(&:name)
             when 'schools'
               School.all.sort_by(&:name)
             when 'shops'
               Shop.all.sort_by(&:name)
             when 'spots'
               Spot.all.sort_by(&:name)
             else
              []
             end

    respond_to do |format|
      format.html { render partial: "pages/cards", locals: { cards: @cards } }
    end
  end
end
