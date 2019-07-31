class GeocodeService 
  def initialize(location)
    @location = location 
  end

  def location
    results ||= get_results
    results[:results][0][:geometry][:location].merge!( location: results[:results][0][:formatted_address])
  end

  def get_results
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn 
    Faraday.new('https://maps.googleapis.com/maps/api/geocode/json') do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY']
      f.params['address'] = @location 
      f.adapter Faraday.default_adapter
    end
  end
end