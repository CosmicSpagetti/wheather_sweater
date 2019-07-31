class Forecast 
  attr_reader :location, 
              :current_weather, 
              :hourly_weather, 
              :daily_weather, 
              :id
  def initialize(json, location)
    @id = nil 
    @location = location[:location]
    @json = json
    @current_weather = current_weather
    @hourly_weather = hourly_weather 
    @daily_weather = daily_weather
  end

  def current_weather
    {time: Time.at(@json[:currently][:time]),
     summary: @json[:currently][:summary],
     temperature: @json[:currently][:temperature],
     feels_like: @json[:currently][:apparentTemperature],
     precipitation: @json[:currently][:precipProbability],
     humidity: @json[:currently][:humidity],
     visibility: @json[:currently][:visibility],
     icon: @json[:currently][:icon],
     high: @json[:daily][:data].first[:temperatureHigh].round,
     low: @json[:daily][:data].first[:temperatureLow].round
    }
  end

  def hourly_weather
    @json[:hourly][:data][0..7].map do |hour|
      { time: Time.at(hour[:time]),
        temperature: hour[:temperature].round,
        icon: hour[:icon]
      }
    end
  end

  def daily_weather
    @json[:daily][:data][1..5].map do |current_day|
      { day: Time.at(current_day[:time]),
        summary: current_day[:summary],
        icon: current_day[:icon],
        precipitation: (current_day[:precipProbability] * 100).round,
        high: current_day[:temperatureHigh].round,
        low: current_day[:temperatureLow].round
      }
    end
  end
end