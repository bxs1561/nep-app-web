class LocationsController < ApplicationController
  require 'geokit'
  Geokit::Geocoders::GoogleGeocoder.api_key = 'AIzaSyBCQUignv1ORcvDq18Z_OAbsaL1bAZjJiA'


  def new
    @locations = Location.new
  end

  def create
    @locations = Location.new(location_store_params)
    if @locations.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  def edit_location
    @locations = Location.find(params[:id])
  end

  def update_location
    @locations = Location.find(params[:id])

    if @locations.update(location_store_params)
      redirect_to @locations
    else
      render 'edit_location'
    end
  end
  def locations

  end

  def convert
    @coords = Geokit::Geocoders::GoogleGeocoder.geocode '140 Market St, San Francisco, CA'
  end



  def destroy_location
    @locations = Location.find(params[:id])
    @locations.destroy

    redirect_to locations_path
    # redirect_to root_path
  end


  private
    def location_store_params
      params.require(:location).permit(:street, :city,:state, :zip_code, :phone_number, :lat, :long, :name, :url, :type)
    end

end