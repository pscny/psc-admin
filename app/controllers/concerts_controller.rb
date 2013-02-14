class ConcertsController < ApplicationController
  def index
    @concerts = Concert.all
  end

  def show
    @concert = Concert.find(params[:id])
  end

  def new
    @concert = Concert.new
  end

  def edit
    @concert = Concert.find(params[:id])
  end

  def create
    @concert = Concert.new(params[:concert])

    if @concert.save
      flash.keep.notice = "#{@concert.name} was successfully created."
      redirect_to :action => :index
    else
      render action: "new"
    end
  end

  def update
    @concert = Concert.find(params[:id])

    if @concert.update_attributes(params[:concert])
      flash.keep.notice = "#{@concert.name} was successfully updated."
      redirect_to @concert
    else
      render action: "edit"
    end
  end

  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy
    redirect_to concerts_url
  end
end
