class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  private

  def authenticate_admin!
    username = ENV["ADMIN_USERNAME"] || local_admin_username
    password = ENV["ADMIN_PASSWORD"] || local_admin_password

    if username.blank? || password.blank?
      raise "ADMIN_USERNAME and ADMIN_PASSWORD must be configured outside local development."
    end

    authenticate_or_request_with_http_basic("Golden Pot Shop administration") do |provided_username, provided_password|
      ActiveSupport::SecurityUtils.secure_compare(provided_username, username) &
        ActiveSupport::SecurityUtils.secure_compare(provided_password, password)
    end
  end

  def local_admin_username
    "admin" if Rails.env.development? || Rails.env.test?
  end

  def local_admin_password
    "golden-pot-local" if Rails.env.development? || Rails.env.test?
  end
end
