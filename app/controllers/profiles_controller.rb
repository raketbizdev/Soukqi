class ProfilesController < ApplicationController
  before_action :authenticate_user!  # Ensure the user is logged in
  before_action :set_profile         # Load the profile before edit/update actions
  before_action :check_profile_completion, only: [ :edit, :update ] # Check for profile completeness
  layout "inner_app"

  # GET /profiles/:id/edit
  def edit
    # Rails will automatically render the edit view
  end

  # PATCH/PUT /profiles/:id
  def update
    Rails.logger.debug("Profile Params: #{profile_params.inspect}")
    if @profile.update(profile_params)
      redirect_to dashboard_path, notice: "Profile updated successfully."
    else
      Rails.logger.debug("Profile update failed: #{@profile.errors.full_messages}")
      flash.now[:alert] = "There were some errors updating your profile."
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :date_of_birth, :address, :city, :state,
                                    :country, :postal_code, :phone_number, :image_profile)
  end

  def check_profile_completion
    if @profile.incomplete?
      flash[:alert] = "Please complete your profile before continuing."
    end
  end
end
