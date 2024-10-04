module Users
  class RegistrationsController < Devise::RegistrationsController
    layout "auth" # Apply the custom 'auth' layout for registration views

    # Custom actions or overrides can be defined here if necessary
  end
end
