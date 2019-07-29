class RoadTripService
  def initialize(starting, end_driving)
    @start = starting 
    @end = end_driving
  end

  def get_time 
    binding.pry
  end

  private 

  def get_results
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn 
    Faraday.new('https://maps.googleapis.com/maps/api/directions/json') do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY']
      f.params['origin'] = @start 
      f.params['destination'] = @end 
      f.adapter Faraday.default_adapter
    end
  end  
end