class ForecastFacade
  
  def initialize(location)
    @location = location
  end

  def get_forecast
    Forecast.new(forcast_service,geocoded_location)
  end

  def geocoded_location
    geocode_service[:results][0][:geometry][:location].merge!( location: geocode_service[:results][0][:formatted_address])
  end

  private

  def geocode_service
    @_geocode_service ||= GeocodeService.new(@location).get_results 
  end

  def forcast_service
    @_forcast_service ||= ForecastService.new(geocoded_location).get_results 
  end
  
end