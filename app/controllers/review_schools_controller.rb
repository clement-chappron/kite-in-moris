class ReviewSchoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index new create load_more]
  before_action :set_school, only: %i[index new create]

  def index
    # @review_schools = @school.review_schools
    @review_schools = @school.review_schools.limit(5)
    respond_to do |format|
      format.html
      format.json { render json: @review_schools }
    end
  end

  def new
    @review_school = ReviewSchool.new
  end

  def create
    # @review_school = ReviewSchool.new(review_school_params)
    # @review_school.school_id = params[:school_id]
    # @review_school.user_id = current_user.id

    # if @review_school.save
    #   redirect_to school_path(params[:school_id])
    # else
    #   render :new
    # end

    @review_school = @school.review_schools.new(review_school_params)
    @review_school.user_id = current_user.id
    if @review_school.save
      respond_to do |format|
        format.html { redirect_to school_path(@school) }
        format.json { render json: @review_school }
      end
    else
      respond_to do |format|
        format.html { render 'schools/show' }
        format.json { render json: @review_school.errors, status: :unprocessable_entity }
      end
    end
  end

  def load_more
    @school = School.friendly.find(params[:school_slug])

    # Charge les avis supplémentaires de l'école
    all_reviews = @school.review_schools.order(created_at: :desc)
    offset = params[:offset].to_i
    limit = params[:limitLoad].to_i

    # @review_schools = all_reviews.offset(offset).limit(limit)
    @review_sschools = all_reviews.drop(params[:offset].to_i).first(params[:limitLoad].to_i)
    # @more_reviews_exist = all_reviews.count > (offset + limit)
    more_reviews_exist = all_reviews.size > (params[:offset].to_i + @review_schools.size)

    # Rendre les nouveaux avis sous forme de partial HTML
    render partial: 'schools/_add_review', locals: { review_schools: @review_schools, more_reviews_exist: @more_reviews_exist }
  end

  private

  def set_school
    @school = School.find(params[:school_slug])

  end

  def review_school_params
    params.require(:review_school).permit(:rating, :description, :school_id, :user_id)
  end
end
