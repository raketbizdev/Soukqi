class ApplicationController < ActionController::Base
  include ApplicationHelper

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_turbo_frame_request_variant, only: [ :edit, :update ] # Apply only where relevant

  rescue_from StandardError, with: :handle_error
  before_action :ensure_profile_complete, if: :user_signed_in?

  private

  def set_turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end

  def handle_error(exception)
    Rails.logger.error(exception.message)
    flash[:error] = "An error occurred. Please try again later."
    redirect_to root_path
  end

  def ensure_profile_complete
    if current_user.profile.nil? || current_user.profile.first_name.blank? || current_user.profile.last_name.blank?
      redirect_to edit_profile_path(current_user.profile), alert: "Please complete your profile before continuing."
    end
  end
end
