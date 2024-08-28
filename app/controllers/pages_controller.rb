class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def update_profile_picture
    @user = current_user
    if params[:user] && params[:user][:profile_picture].present?
      if @user.update(profile_picture: params[:user][:profile_picture])
        respond_to do |format|
          format.html { redirect_to edit_user_registration_path, notice: 'Photo de profil mise à jour avec succès.' }
          format.json { render json: { profile_picture_url: @user.profile_picture.url } }
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to edit_user_registration_path, alert: 'Aucune photo de profil sélectionnée.' }
        format.json { render json: { error: 'Aucune photo de profil sélectionnée.' }, status: :unprocessable_entity }
      end
    end
  end
end
