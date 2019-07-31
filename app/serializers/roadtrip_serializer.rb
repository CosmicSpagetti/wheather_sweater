class RoadtripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :weather, :trip_duration, :location
end
