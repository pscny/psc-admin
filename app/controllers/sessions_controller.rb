class SessionsController < ApplicationController
  skip_before_filter :authenticate!

  def create
    admin = Admin.find_or_create_from_auth_hash(auth_hash)
    if admin.active?
      sign_in admin
      redirect_to root_path
    else
      flash.keep.alert = 'Your account is inactive'
      redirect_to sign_in_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
