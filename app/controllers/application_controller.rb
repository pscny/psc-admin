class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate!

  def current_admin
    @__current_admin ||= Admin.where(:id => session['admin_id']).first
  end
  helper_method :current_admin

  def current_admin=(admin)
    session['admin_id'] = admin.id
    @__current_admin   = admin
  end

  private

  def sign_in(admin)
    self.current_admin = admin
  end

  def sign_out
    session.delete('admin_id')
    @__current_admin = nil
  end

  protected

  def authenticate!
   unless current_admin
     flash.keep.alert = 'Please log in'
     redirect_to sign_in_path
   end
  end
end
