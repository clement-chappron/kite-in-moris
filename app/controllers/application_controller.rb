class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # if params[:query].present?
  #   @results = PgSearch.multisearch(params[:query])
  # end
end
