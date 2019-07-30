class Forecast 
  def initialize(json, location)
    @location = location
    @json = json
    @current_weather = current_weather
    @hourly_weather = hourly_weather 
    @daily_weather = daily_weather
  end

  def current_weather
    {time: Time.at(@json[:currently][:time]),
     summary: @json[:currently][:summary],
     temperature: @json[:currently][:temperature],
     icon: @json[:currently][:icon],
      
    }
    binding.pry
  end

  def hourly_weather
    @json[:hourly][:data][0..7].map do |hour|
      {time: Time.at(hour[:time]).strftime("%I:%M %p"),
        temperature: hour[:temperature].round}
    end
  end
end