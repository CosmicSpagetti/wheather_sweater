class RoadtripFacade 
  def initialize(params)
    @origin = params[:origin]
    @destination = params[:destination]
  end

  def roadtrip_results 
    duration = google_service[:routes].first[:legs].first[:duration][:text]
    Roadtrip.new(forecast_service, get_location, duration)
  end
  
  private 

  def time_of_arrival
    duration = google_service[:routes].first[:legs].first[:duration][:value]
    Time.now.to_i + duration
  end

  def get_location
    google_service[:routes].first[:legs].first[:end_address]
  end

  def get_coordinates 
    google_service[:routes].first[:legs].first[:end_location]
  end

  def google_service
    @_google_service ||= GoogleService.get_directions(@origin, @destination)
  end

  def forecast_service 
    @_forecast_service ||= ForecastService.new(get_coordinates).get_future_or_past_results(time_of_arrival)
  end
end