class ForecastService 
  def initialize(location_params) 
    @lat = location_params[:lat]
    @lng =  location_params[:lng]
  end

  def get_future_or_past_results(time)
    response = conn.get("#{@lat},#{@lng},#{time}")
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def get_results
    response = conn.get("#{@lat},#{@lng}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/") do |f|
      f.params['exclude'] = 'minutely,alerts,flags' 
      f.adapter Faraday.default_adapter
    end
  end
end