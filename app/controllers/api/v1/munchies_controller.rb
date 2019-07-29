class Api::V1::MunchiesController < ApplicationController
  def index
    time_for_yelp_service = Time.now.to_i + get_time_to_travel[:duration][:value]
    binding.pry
    render json: YelpSerializer.new(YelpService.new(time_for_yelp_service, get_time_to_travel, params[:food]).get_results)
  end 

  private 

  def get_time_to_travel
    @get_time_to_travel ||= RoadTripService.new(params[:start], params[:end]).get_time
  end
end