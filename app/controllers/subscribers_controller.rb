class SubscribersController < ApplicationController

  def index
    @subscribers = Subscriber.page(params[:page] || 1)
    if @query = params[:query]
      regex = /#{@query}/i
      @subscribers = @subscribers.or([ { :first_name => regex },
                                       { :last_name  => regex },
                                       { :email      => regex } ])
    end
    @subscribers
  end

  def show
    @subscriber = Subscriber.find(params[:id])
  end

  def new
    @subscriber = Subscriber.new
  end

  def edit
    @subscriber = Subscriber.find(params[:id])
  end

  def create
    @subscriber = Subscriber.new(params[:subscriber])

    if @subscriber.save
      flash.keep.notice = "#{@subscriber.full_name} was successfully created."
      redirect_to action: :index
    else
      render action: 'new'
    end
  end

  def update
    @subscriber = Subscriber.find(params[:id])

    if @subscriber.update_attributes(params[:subscriber])
      flash.keep.notice = "Successfully updated #{@subscriber.full_name}"
      redirect_to action: :index, notice: 'Subscriber was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy

    redirect_to subscribers_url
  end
end
