class ReviewSchoolsController < ApplicationController
  def index
    @school = School.find(params[:school_id])
    @review_schools = @school.review_schools
  end
end
