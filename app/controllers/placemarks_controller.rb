class PlacemarksController < ApplicationController
  # GET /placemarks
  # GET /placemarks.json

  def index
    puts params[:q]
    if params[:q]
      latlon = params[:q]
      lat = latlon.split(',').first
      lon = latlon.split(',').last
      @placemarks = Placemark.gimme_photos lat, lon
    else
      @placemarks = Placemark.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @placemarks }
    end
  end

  # GET /placemarks/1
  # GET /placemarks/1.json
  def show
    @placemark = Placemark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @placemark }
    end
  end
end
