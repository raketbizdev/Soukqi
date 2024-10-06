# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  layout "auth"

  # Skip the `set_turbo_frame_request_variant` callback inherited from `ApplicationController`
  skip_before_action :set_turbo_frame_request_variant

  def create
    self.resource = warden.authenticate!(auth_options)
    if resource.confirmed?
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      # Custom flash message for unconfirmed users
      flash[:alert] = "You have to confirm your account before continuing."
      redirect_to new_user_session_path
    end
  end
end
