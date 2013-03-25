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
    else
    end
  end


  private

  def set_tab
    @tab = 'members'
  end

end
