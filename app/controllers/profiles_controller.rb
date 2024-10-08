class ProfilesController < ApplicationController
  skip_before_action :ensure_profile_complete, only: %i[edit update]
  before_action :set_profile, only: %i[edit update]
  layout "inner_app"

  # GET /profiles/1/edit
  def edit
  end

  # PATCH/PUT /profiles/1
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        flash[:notice] = "Profile was successfully updated."
        format.html { render :edit } # Keep the user on the edit page
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :date_of_birth, :address, :city, :state, :country, :postal_code, :phone_number, :bio, :image_profile)
  end
end
