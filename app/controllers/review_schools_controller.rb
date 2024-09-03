class ReviewSchoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_school, only: %i[index new create]

  def index
    @review_schools = @school.review_schools
  end

  def new
    @review_school = ReviewSchool.new
  end

  def create
    @review_school = ReviewSchool.new(review_school_params)
    @review_school.school = @school
    @review_school.user = current_user
    if @review_school.save
      redirect_to school_review_schools_path(@school)
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
