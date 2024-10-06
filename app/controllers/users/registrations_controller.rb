# app/controllers/users/registrations_controller.rb
module Users
  class RegistrationsController < Devise::RegistrationsController
    layout "auth" # Use the custom 'auth' layout for Devise views

    # Override the create method to handle Turbo responses
    def create
      build_resource(sign_up_params)

      resource.save
      yield resource if block_given?

      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_to do |format|
            format.html { redirect_to after_sign_up_path_for(resource) }
            format.turbo_stream { render turbo_stream: turbo_stream.replace("sign_up_frame", partial: "devise/shared/links") }
          end
        else
          expire_data_after_sign_in!
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_to do |format|
          format.html { render :new }
          format.turbo_stream { render turbo_stream: turbo_stream.replace("sign_up_frame", partial: "devise/registrations/new", locals: { resource: resource }) }
        end
      end
    end
  end
end
