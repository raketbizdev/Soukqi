class ApplicationController < ActionController::Base
  include ApplicationHelper

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_turbo_frame_request_variant, only: [ :new, :create, :edit, :update ]

  rescue_from StandardError, with: :handle_error

  private

  def set_turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end

  def handle_error(exception)
    Rails.logger.error(exception.message)
    flash[:error] = "An error occurred. Please try again later."
    redirect_to root_path
  end
end
