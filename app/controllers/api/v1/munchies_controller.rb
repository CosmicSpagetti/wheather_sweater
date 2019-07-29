class Api::V1::MunchiesController < ApplicationController
  def index
    render json: YelpSerializer.new(Yelp.new(yelp_service))
  end 

  private 

  def get_time_to_travel
    @get_time_to_travel ||= RoadTripService.new(params[:start], params[:end]).get_time
  end

  def yelp_service 
    time_for_yelp_service = Time.now.to_i + get_time_to_travel[:duration][:value]
    yelp_service ||= YelpService.new(time_for_yelp_service, get_time_to_travel, params[:food]).get_3_restaurants
  end
end