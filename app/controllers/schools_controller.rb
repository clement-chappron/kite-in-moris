class SchoolsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_school, only: [:edit, :update, :show, :destroy]
  before_action :set_school_step, only: [:create_step_1, :create_step_2, :create_step_3, :create_step_4]
  before_action :find_school, only: [:create_step_2, :create_step_3, :create_step_4]


  def show
    @review_schools = ReviewSchool.all
    # @review_school = ReviewSchool.new

    @school = School.find(params[:id])

    @review_schools = @school.review_schools
    @average_rating = @review_schools.average(:rating).to_f.round(1)
    @total_review_schools = @review_schools.count

    @review_school = @school.review_schools.build
    @review_schools = @school.review_schools.limit(5)
    @more_reviews_exist = @school.review_schools.count > 5
  end

  def new
    @school = School.new
    @locations = Location.all
    @step = params[:step].to_i
  end

  def create_step_1
    @school.assign_attributes(school_params_step_1)
    if @school.save
      redirect_to new_school_path(step: 2)
    else
      @step = 1
      render :new
    end
  end

  def create_step_2
    if @school.update(school_params_step_2)
      redirect_to new_school_path(step: 3)
    else
      @step = 2
      render :new
    end
  end

  def create_step_3
    if @school.update(school_params_step_3)
      redirect_to new_school_path(step: 4)
    else
      @step = 3
      render :new
    end
  end

  def create_step_4
    if @school.update(school_params_step_4)
      redirect_to @school, notice: 'Établissement créé avec succès.'
    else
      @step = 4
      render :new
    end
  end

  def update
    @school = School.find(params[:id])
  
    # Attacher les nouvelles images sans supprimer les anciennes
    if params[:school][:images]
      @school.images.attach(params[:school][:images])
    end
  
    if @school.update(school_params)
      redirect_to @school, notice: 'School was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @school.destroy
    redirect_to schools_path, notice: 'School was successfully deleted.'
  rescue ActiveRecord::RecordNotFound
    redirect_to schools_path, alert: 'School not found.'
  end

  private

  def set_school
    @school = School.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to schools_path, alert: 'School not found.'
  end

  def set_school_step
    @school = School.find_or_initialize_by(id: params[:id])
  end

  def school_params_step_1
    params.require(:school).permit(:name, :address, :phone, :website, :email)
  end

  def school_params_step_2
    params.require(:school).permit(:description)
  end

  def school_params_step_3
    params.require(:school).permit(:rental, :levels)
  end

  def school_params_step_4
    params.require(:school).permit(:fee, :facebook, :instagram, :location_id)
  end

  def school_params
    params.require(:school).permit(:name, :email, :address, :phone, :website, :description, :rental, :levels, :fee, :location_id, :facebook, :instagram, :latitude, :longitude, :category, images: [] )
  end
end
