class Api::V1::RoadtripController < ApplicationController
  def show
    user = User.find_by(api_key: params[:api_key])
    if user 
      render json: RoadtripSerializer.new(RoadtripFacade.new(params).roadtrip_results)
    else 
      render json: {error:  "Go away"}, status: 401
    end
  end
end