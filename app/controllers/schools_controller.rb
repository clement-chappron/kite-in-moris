class SchoolsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_school, only: [:edit, :update, :show, :destroy]
  before_action :set_school_step, only: [:create_step_1, :create_step_2, :create_step_3, :create_step_4]

  def show
    @review_school = ReviewSchool.new
    @reviews_school = @school.review_schools

    @average_rating = @reviews_school.average(:rating).to_f.round(1)
    @total_review_schools = @reviews_school.count

    @review_schools = @school.review_schools.order(created_at: :desc).limit(5)
    # @more_reviews_exist = @total_review_schools > 5
  end

  def new
    @school = School.new
    @locations = Location.all
    @step = params[:step].to_i
  end

  def create_step_1
    @school.assign_attributes(school_params_step_1)
    @school.user = current_user
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
    Rails.logger.info("Paramètres avant la mise à jour : #{school_params_step_4.inspect}")
    if @school.update(school_params_step_4)
      redirect_to school_path(@school), notice: 'School was succefully created.'
    else
      Rails.logger.error("Update error: #{@school.errors.full_messages}")
      @step = 4
      render :new
    end
  end

  def edit
  end

  def update
    if school_params[:images]
      @school.images.attach(school_params[:images])
    end
    if @school.update(school_params.except(:images))
      redirect_to @school, notice: "School updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @school.destroy
    redirect_to root_path, notice: 'School was successfully destroyed.'
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def set_school_step
    @school = School.find_or_initialize_by(id: params[:id])
    @school.user ||= current_user
  end

  def school_params_step_1
    params.require(:school).permit(:name, :email, :address, :phone, :website, :description, :rental, :levels, :fee, :location_id, :facebook, :instagram, :latitude, :longitude, :category, images: [])
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
    params.require(:school).permit(:name, :email, :address, :phone, :website, :description, :rental, :levels, :fee, :location_id, :facebook, :instagram, :latitude, :longitude, :category, images: [])
  end
end
