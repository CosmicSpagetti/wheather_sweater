class Api::V1::MunchiesController < ApplicationController
  def index
    time_to_travel = RoadTripService.get_time(params[:start], params[:end])
  end 
end