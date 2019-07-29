class Api::V1::MunchiesController < ApplicationController
  def index
    time_to_travel = RoadTripService.new(params[:start], params[:end]).get_time
    time_for_yelp_service = Time.now.to_i + time_to_travel[:duration][:value]
    render json: YelpService.new(time_for_yelp_service, time_to_travel, params[:food]).get_results
  end 
end