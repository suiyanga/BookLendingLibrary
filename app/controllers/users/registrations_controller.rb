class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    sign_in(resource) # Ensure the user is signed in
    books_path # Redirect to books page
  end
end
