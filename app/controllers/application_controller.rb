class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_admin

  #before_filter :authorize_admin

  private

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def sign_in(admin)
    session[:admin_id] = admin.id
  end

  def sign_out
    session[:admin_id] = nil
  end

  #def authorize_member
  #  if current_admin.nil?
  #    sign_out
  #  end
  #end
end
