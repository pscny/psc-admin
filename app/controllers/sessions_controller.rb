class SessionsController < ApplicationController
  skip_before_filter :authorize_admin

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.authenticate(params[:admin])
    if @admin
      sign_in @admin
      redirect_to root_path
    else
      @admin = Admin.new params[:admin]
      flash[:error] = "Oops, wrong email or password!"
      render :action => :new
    end
  end

  def destroy
    sign_out
  end
end
