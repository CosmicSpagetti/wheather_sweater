class MunchiesFacade
  
  def initialize(params)
    @start = params[:start]
    @end = params[:end]
    @food = params[:food]
  end

  def get_time 
    google_service[:routes].first[:legs].first
  end

  def yelp_restaurants
    yelp_service[:businesses].map do |business|
      YelpRestaurant.new(business)
    end
  end

  def time_of_destination
    Time.now.to_i + get_time[:duration][:value]
  end

  private 

  def google_service
    @_google_service ||= GoogleService.get_directions(@start, @end)
  end

  def yelp_service 
    @_yelp_service ||= YelpService.new(time_of_destination, get_time, @food).get_restaurants_by_count(3)
  end
end  