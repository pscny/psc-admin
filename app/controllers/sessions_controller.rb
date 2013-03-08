class SessionsController < ApplicationController
  skip_before_filter :authenticate!

  def create
    sign_in Admin.find_or_create_from_auth_hash(auth_hash)
    redirect_to root_path
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
