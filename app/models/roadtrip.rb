class Roadtrip 
  attr_reader :id, 
              :weather, 
              :location, 
              :trip_duration
  def initialize(json, location, duration)
    @id = 1
    @weather = get_weather(json)
    @location = location 
    @trip_duration = duration 
  end

  def get_weather(json) 
    {
      temperature: json[:currently][:temperature],
      summary: json[:currently][:summary]
    }
  end
end