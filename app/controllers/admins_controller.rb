class AdminsController < ApplicationController

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      flash.keep.notice = "Successfully created #{@admin.name}"
      redirect_to edit_admin_path(@admin)
    else
      render :action => :new
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      flash.keep.notice = "Successfully updated #{@admin.name}"
      redirect_to admins_path
    else
      render :action => :edit
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    if @admin.deactivate!
      flash.keep.notice = "#{@admin.name} has been deactivated"
    end
    redirect_to admins_path
  end

end
