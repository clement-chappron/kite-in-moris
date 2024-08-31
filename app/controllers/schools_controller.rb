class SchoolsController < ApplicationController
  def index
    if params[:location_id]
      @schools = School.where(location_id: params[:location_id])
    else
      @schools = School.all
    end

    respond_to do |format|
      format.html # Pour les requêtes normales
      format.turbo_stream { render partial: 'schools_list', locals: { schools: @schools } }
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
end
