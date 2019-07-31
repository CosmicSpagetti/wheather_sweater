class Api::V1::MunchiesController < ApplicationController
  def index
    render json: YelpSerializer.new(MunchiesFacade.new(params).yelp_restaurants)
  end 
end