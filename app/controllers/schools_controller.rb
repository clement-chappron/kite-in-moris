class SchoolsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:location_id]
      @schools = School.where(location_id: params[:location_id])
    else
      @schools = School.all
    end

    respond_to do |format|
      format.html # Pour le rendu standard HTML
      format.turbo_stream { render partial: 'schools/schools_list', locals: { schools: @schools } }
    end
    

    @schools = @schools.order(created_at: :desc).limit(6).offset(params[:offset] || 0)

    @locations = Location.all

    # @markers = @schools.geocoded.map do |school|
    #   {
    #     lat: school.latitude,
    #     lng: school.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: { school: school })
    #   }
    # end
  end

  def show
    @school = School.find(params[:id])

    # Horaires d'ouverture associés à l'école
    @opening_hours = @school.opening_hours

    # Reviews associés à l'école
    @reviews = @school.reviews.includes(:user)

    # Données pour le marqueur sur la carte
    # @marker = {
    #   lat: @school.latitude,
    #   lng: @school.longitude,
    #   info_window: render_to_string(partial: "info_window", locals: { school: @school })
    # }
  end

  def new
    @school = current_user.schools.build
  end

  def create
    @school = current_user.schools.build(school_params)
    if @school.save
      redirect_to @school, notice: 'Établissement créé avec succès.'
    else
      render :new
    end
  end

  private

  def school_params
    params.require(:school).permit(:name, :address, :phone, :website, :email, :description, :type, :location_id)
  end
end
