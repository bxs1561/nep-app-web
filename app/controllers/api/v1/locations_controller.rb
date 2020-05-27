class Api::V1::LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token



  def index
    render json: Location.all

  end
  def new
    @location= Location.new
  end

  def show
    @location = Location.find(params[id])
    render json: @location
  end

  def create
    @location = Location.new(location_store_params)
    @location.status = :requested

    if @location.save
      @data = {
          success: true,
          message: 'Ride successfully requested.'
          # render json: image_store, status: :created, location: api_post_path(image_store)

      }
    else
      @data = {
          error: true,
          message: location.errors.full_messages
          # render json: @post.errors, status: :unprocessable_entity

      }

    end
    render json: @data
  end

  def update
    Location.update(location_store_params)
    head :no_content
  end

  def destroy
    Location.destroy(location_store_params)
    head :no_content
  end



  private
    def location_store_params
      params.require(:location).permit(:street, :city,:state, :zip_code, :phone_number, :lat, :long, :name, :url, :type)
    end

end
