class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, 
             :current_weather, 
             :hourly_weather, 
             :daily_weather 
end
