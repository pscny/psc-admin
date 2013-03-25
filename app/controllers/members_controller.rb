class MembersController < ApplicationController

  def index
    @members = Member.page(params[:page] || 1)
    if @query = params[:query]
      regex = /#{@query}/i
      @members = @members.or([{ :first_name => regex },
                              { :last_name  => regex },
                              { :email      => regex }])
    end
    flash.alert = 'No Members Found' if @members.none?
    @members
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(params[:member])

    if @member.save
      flash.keep.notice = "#{@member.full_name} was successfully created."
      redirect_to action: :index
    else
      render action: 'new'
    end
  end

  def update
    @member = Member.find(params[:id])

    if @member.update_attributes(params[:member])
      flash.keep.notice = "Successfully updated #{@member.full_name}"
      redirect_to action: :index
    else
      render action: 'edit'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    redirect_to members_url
  end

  private

  def set_tab
    @tab = 'members'
  end

end
