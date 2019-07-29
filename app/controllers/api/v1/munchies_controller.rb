class Api::V1::MunchiesController < ApplicationController
  def index
    time_to_travel = RoadTripService.new(params[:start], params[:end]).get_time
  end 
end