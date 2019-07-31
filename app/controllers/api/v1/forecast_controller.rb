class Api::V1::ForecastController < ApplicationController
  def show
    coordinates = GeocodeService.new(params[:location]).location
    json = ForecastService.new(coordinates).get_results 
    render json: ForecastSerializer.new(Forecast.new(json, coordinates))
  end
end