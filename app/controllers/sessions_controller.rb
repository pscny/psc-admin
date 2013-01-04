class SessionsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.where(params[:admin]).first
    session[:admin_id] = admin.id
    redirect_to root_path
  end
end
