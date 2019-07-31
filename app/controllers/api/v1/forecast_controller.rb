class Api::V1::ForecastController < ApplicationController
  def show
    render json: ForecastSerializer.new(ForecastFacade.new(params[:location]).get_forecast)
  end
end