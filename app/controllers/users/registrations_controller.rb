# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :configure_permitted_parameters, if: :devise_controller?


  def update_profile_picture
    @user = current_user
    if @user.update(profile_picture_params)
      respond_to do |format|
        format.html { redirect_to edit_user_registration_path, notice: 'Profile updated successfully' }
        format.json { render json: { profile_picture_url: url_for(@user.profile_picture) } }
      end
    else
      respond_to do |format|
        format.html { redirect_to edit_user_registration_path, alert: 'Failed to update profile.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_image_and_bio
    if user_signed_in?
      @user = current_user
    else
      redirect_to edit_image_and_bio_path
    end
  end

  def update_image_and_bio
    @user = current_user
    if @user.update(profile_picture_and_bio_params)
      respond_to do |format|
        format.html { redirect_to edit_image_and_bio_path, notice: 'Profile updated successfully.' }
        format.json { render json: { profile_picture_url: url_for(@user.profile_picture) } }
      end
    else
      respond_to do |format|
        format.html { redirect_to edit_image_and_bio_path, alert: 'Failed to update profile.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  def profile_picture_and_bio_params
    params.require(:user).permit(:profile_picture, :bio)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :profile_picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :profile_picture])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  #

end
