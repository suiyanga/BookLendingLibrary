class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    books_path # Redirect to index.html.erb (books list)
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # Redirect to login page after logout
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end
end
