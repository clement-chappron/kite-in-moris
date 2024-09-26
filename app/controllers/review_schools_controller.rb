class ReviewSchoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new create load_more]
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
      # redirect_to school_path(@review_school.school_id)
      redirect_to school_path(@review_school.school_id), notice: "Review créée avec succès"
    else
      render :new, notice: "Erreur lors de la création de la review"
    end
  end

  def load_more
    @school = School.find(params[:school_id])
    offset = params[:offset].to_i
    limit = params[:limitLoad].to_i

    @review_schools = @school.review_schools.order(created_at: :desc).offset(offset).limit(limit)

    # Vérifie s'il reste des reviews à charger
    more_reviews_exist = @school.review_schools.count > offset + limit

    render partial: "schools/review_schools", locals: { review_schools: @review_schools, more_reviews_exist: more_reviews_exist }
  end

  private

  def set_school
    @school = School.find(params[:school_id] || params[:id])

  end

  def review_school_params
    params.require(:review_school).permit(:rating, :description, :school_id, :user_id)
  end
end
