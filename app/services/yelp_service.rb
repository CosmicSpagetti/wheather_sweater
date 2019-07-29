class YelpService
  def initialize(time, hash_of_info, food)
    @open_at = time
    @location = hash_of_info[:end_address]
    @food = food
  end

  def get_results
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  private 

  def conn 
    Faraday.new('https://api.yelp.com/v3/businesses/search') do |f|
      f.params['location'] = @location
      f.params['open_at'] = @open_at
      f.params['term'] = @food
      f.authorization :Bearer, ENV['YELP_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end  

end