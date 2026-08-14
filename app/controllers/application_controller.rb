class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  private

  def authenticate_admin!
    return if session[:admin_authenticated] == true

    session[:admin_return_to] = request.fullpath if request.get?
    redirect_to admin_login_path, alert: "管理画面を開くにはログインしてください。"
  end

  def admin_credentials_valid?(provided_username, provided_password)
    username, password = admin_credentials
    return false if username.blank? || password.blank?

    ActiveSupport::SecurityUtils.secure_compare(Digest::SHA256.hexdigest(provided_username.to_s), Digest::SHA256.hexdigest(username)) &
      ActiveSupport::SecurityUtils.secure_compare(Digest::SHA256.hexdigest(provided_password.to_s), Digest::SHA256.hexdigest(password))
  end

  def admin_credentials
    [ENV["ADMIN_USERNAME"].presence || local_admin_username, ENV["ADMIN_PASSWORD"].presence || local_admin_password]
  end

  def local_admin_username
    "admin" if Rails.env.development? || Rails.env.test?
  end

  def local_admin_password
    "golden-pot-local" if Rails.env.development? || Rails.env.test?
  end
end
