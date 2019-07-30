class Api::V1::ForecastController < ApplicationController
  def show
    coordinates = GeocodeService.new(params[:location]).lat_lng
    json = ForecastService.new(coordinates).get_forecast_results 
    render json: ForecastSerializer.new(Forecast.new(json))
  end

end