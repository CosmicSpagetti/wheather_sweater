class GoogleService 

  def self.get_geocode(location)
    new.get_results('geocode/json', { address: location})
  end

  def self.get_directions(starting_location, end_location)
    new.get_results('directions/json', { origin: starting_location, destination: end_location} )
  end
  
  def get_results(url, params)
    response = conn.get(url,params)
    JSON.parse(response.body, symbolize_names: true)
  end

  private 

  def conn 
    Faraday.new('https://maps.googleapis.com/maps/api/') do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY']
      f.params['address'] = @location 
      f.adapter Faraday.default_adapter
    end
  end
end