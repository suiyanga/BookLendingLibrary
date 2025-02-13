class Users::SessionsController < Devise::SessionsController
  protected

  def after_sign_out_path_for(_resource_or_scope)
    reset_session # Ensure all session data is cleared
    root_path # Redirect to index page with login/signup links
  end
end
