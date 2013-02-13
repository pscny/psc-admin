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
      redirect_to @concert, notice: 'Concert was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @concert = Concert.find(params[:id])

    if @concert.update_attributes(params[:concert])
      redirect_to @concert, notice: 'Concert was successfully updated.'
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
