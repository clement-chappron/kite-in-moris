class ReviewSchoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new create]
  before_action :set_school, only: %i[index new create]

  def index
    @review_schools = @school.review_schools
  end

  def new
    @review_school = ReviewSchool.new
  end

  def create
    @review_school = ReviewSchool.new(review_school_params)
    @review_school.school_id = params[:school_id]
    @review_school.user_id = current_user.id

    if @review_school.save
      redirect_to school_path(params[:school_id])
    else
      render :new
    end
  end

  private

  def set_school
    @school = School.find(params[:school_id])

  end

  def review_school_params
    params.require(:review_school).permit(:rating, :description, :school_id, :user_id)
  end
end
