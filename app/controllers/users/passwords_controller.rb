class Users::PasswordsController < Devise::PasswordsController
  # Make sure you are inheriting from Devise::PasswordsController

  # Apply the 'auth' layout for password-related views
  layout "auth"

  # There’s no need to redefine the `new` action unless you want to customize it.
  # If you want to customize it, call `super` to inherit Devise’s functionality:
  #
  # def new
  #   super
  # end

  # If you don't override `create` or `edit` actions, keep them empty:
  # def create
  #   super
  # end
end
