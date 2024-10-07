class Users::ConfirmationsController < Devise::ConfirmationsController
  layout "auth" # Apply the 'auth' layout to this controller
  before_action :set_turbo_frame_request_variant, only: [ :new, :create, :edit ]

  # GET /resource/confirmation/new
  def new
    super
  end

  # GET /resource/confirmation/edit
  def edit
    # Your implementation for the edit action here
  end

  # POST /resource/confirmation
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      set_flash_message!(:notice, :send_instructions)
      respond_with({}, location: after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  protected

  def after_resending_confirmation_instructions_path_for(resource_name)
    new_session_path(resource_name)
  end
end
