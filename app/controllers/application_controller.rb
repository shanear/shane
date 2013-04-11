class ApplicationController < ActionController::Base
  protect_from_forgery

  ADMIN_KEY = ENV["ADMIN_PASSWORD"] || "password"

  def login
    if params[:key] == ADMIN_KEY
      cookies.permanent[:admin] = true
    end

    redirect_to admin_articles_path if admin?
  end

  protected

  def admin?
    cookies[:admin]
  end
  helper_method :admin?

  def requires_admin
    redirect_to admin_path unless admin?
  end
end
