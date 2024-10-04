class Users::ConfirmationsController < Devise::ConfirmationsController
  layout "auth" # Apply the 'auth' layout to this controller
end
