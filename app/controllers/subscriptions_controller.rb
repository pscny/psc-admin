class SubscriptionsController < ApplicationController

  def index
    @member        = Member.find(params[:member_id])
    @subscriptions = @member.subscriptions
  end

  def new
    @member       = Member.find(params[:member_id])
    @subscription = @member.subscriptions.new
  end

  def create
    @member       = Member.find(params[:member_id])
    @subscription = @member.subscriptions.build(params[:subscription])
    if @subscription.save
      flash.keep.notice = "#{@member.full_name} is subscribed to #{@subscription.concert_series.name}"
      redirect_to :action => :index
    else
    end
  end


  private

  def set_tab
    @tab = 'members'
  end
end
