class Api::V1::ForecastController < ApplicationController
  def show
    coordinates = GeocodeService.new(params[:location])
    binding.pry
    render :json 
  end
end