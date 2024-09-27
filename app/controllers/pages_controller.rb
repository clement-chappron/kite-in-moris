class PagesController < ApplicationController
  layout 'create_company_layout', only: [:create_company]
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

  def create_company
  end

  def filter_categories
    @category = params[:category]
    @location = params[:location]
    query = params[:query]

    if query.present?
      @cards = case @category
      when 'all'
        [search_in_all_columns(School, query), search_in_all_columns(Shop, query), search_in_all_columns(Spot, query)].flatten
      when 'schools'
        search_in_all_columns(School, query)
      when 'shops'
        search_in_all_columns(Shop, query)
      when 'spots'
        search_in_all_columns(Spot, query)
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


  private

  def search_in_all_columns(klass, query)
    unless [School, Shop, Spot].include?(klass)
      raise ArgumentError, "Classe non supportée"
    end

    search_terms = query.split
    columns = klass.column_names
    conditions = []
    search_terms.each do |term|
      column_conditions = []
      columns.each do |column|
        column_conditions << "#{klass.table_name}.#{column}::text ILIKE ?"
      end

      conditions << "(#{column_conditions.join(' OR ')})"
    end
    sql_conditions = conditions.join(' AND ')
    values = search_terms.flat_map { |term| Array.new(columns.size, "%#{term}%") }

    klass.where(sql_conditions, *values)
  end

end
