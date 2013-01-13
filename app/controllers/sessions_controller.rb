class SessionsController < ApplicationController
  skip_before_filter :authorize_admin

  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.where(params[:admin]).first
    sign_in admin
    redirect_to root_path
  end

  def destroy
    sign_out
  end
end
