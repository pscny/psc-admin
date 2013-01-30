class ConcertSeriesController < ApplicationController

  def index
    @concert_series = ConcertSeries.all
  end

  # GET /concert_series/1
  # GET /concert_series/1.json
  def show
    @concert_series = ConcertSeries.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @concert_series }
    end
  end

  def new
    @concert_series = ConcertSeries.new
  end

  # GET /concert_series/1/edit
  def edit
    @concert_series = ConcertSeries.find(params[:id])
  end

  def create
    @concert_series = ConcertSeries.new(params[:concert_series])

    if @concert_series.save
      redirect_to @concert_series, notice: 'Concert series was successfully created.'
    else
      render action: :new
    end
  end

  # PUT /concert_series/1
  # PUT /concert_series/1.json
  def update
    @concert_series = ConcertSeries.find(params[:id])

    respond_to do |format|
      if @concert_series.update_attributes(params[:concert_series])
        format.html { redirect_to @concert_series, notice: 'Concert series was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @concert_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concert_series/1
  # DELETE /concert_series/1.json
  def destroy
    @concert_series = ConcertSeries.find(params[:id])
    @concert_series.destroy

    respond_to do |format|
      format.html { redirect_to concert_series_index_url }
      format.json { head :no_content }
    end
  end
end
