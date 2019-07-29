class Api::V1::ForecastController < ApplicationController
  def show
    coordinates = GeocodeService.new(params[:location]).lat_lng
    # ForecastService.new(coordinates).get_results
  end
  private

  def coordinates 
    coordinates = GeocodeService.new(params[:location]).lat_lng
    # ForecastService.new(coordinates)
  end
end