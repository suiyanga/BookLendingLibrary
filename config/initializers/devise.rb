Devise.setup do |config|
  require "devise/orm/active_record" # Ensure Devise ORM is loaded

  # config.orm = :active_record
  config.secret_key = 'some-random-secret-key' # Replace with a secure key
  config.mailer_sender = "please-change-me@example.com"

  # Fix for Devise mapping issue
  config.skip_session_storage = []  # Enable session storage
  config.sign_out_via = :delete      # Ensure sign-out uses DELETE request

  # Fix Turbo redirect issue (if using Turbo)
  config.navigational_formats = [ "*/*", :html ]

  # Ensure Devise uses correct modules
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other
end
