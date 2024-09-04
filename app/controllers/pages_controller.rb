class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def filter_categories
    @category = params[:category]

    @cards = case @category
             when 'all'
                School.all + Shop.all + Spot.all
             when 'schools'
               School.all
             when 'shops'
                Shop.all
             when 'spots'
                Spot.all
             else
                School.all + Shop.all + Spot.all
             end

    respond_to do |format|
      format.html { render partial: "pages/cards", locals: { cards: @cards } }
    end
  end
end
