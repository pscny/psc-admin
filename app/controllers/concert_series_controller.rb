class ConcertSeriesController < ApplicationController

  def index
    @concert_series = ConcertSeries.all
  end

  def show
    @concert_series = ConcertSeries.find(params[:id])
  end

  def new
    @concert_series = ConcertSeries.new
  end

  def edit
    @concert_series = ConcertSeries.find(params[:id])
  end

  def create
    @concert_series = ConcertSeries.new(params[:concert_series])

    if @concert_series.save
      flash.keep.notice = "The #{@concert_series.name} Concert Series was successfully created."
      redirect_to @concert_series
    else
      render action: :new
    end
  end

  def update
    @concert_series = ConcertSeries.find(params[:id])

    if @concert_series.update_attributes(params[:concert_series])
      redirect_to @concert_series, notice: 'Concert series was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @concert_series = ConcertSeries.find(params[:id])
    @concert_series.destroy
    redirect_to concert_series_index_url
  end
end
