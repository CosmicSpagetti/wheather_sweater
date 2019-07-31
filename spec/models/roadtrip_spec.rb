require 'rails_helper'

describe 'Roadtrip object' do 
  it 'can parse through data and return only needed info' do 
    params = {:latitude=>38.2542053,
       :longitude=>-104.6087488,
       :timezone=>"America/Denver",
       :currently=>
        {:time=>1564601292,
         :summary=>"Clear",
         :icon=>"clear-day",
         :precipIntensity=>0.0007,
         :precipProbability=>0.01,
         :precipType=>"rain",
         :temperature=>98.79,
         :apparentTemperature=>98.79,
         :dewPoint=>44.64,
         :humidity=>0.16,
         :pressure=>1009.6,
         :windSpeed=>8.12,
         :windGust=>10.96,
         :windBearing=>354,
         :cloudCover=>0,
         :uvIndex=>11,
         :visibility=>10,
         :ozone=>293.2}}

        roadtrip = Roadtrip.new(params, "Pueblo, CO, USA", "1 hour" )

        expect(roadtrip.location).to eq("Pueblo, CO, USA")
        expect(roadtrip.weather[:summary]).to eq("Clear")
        expect(roadtrip.weather[:temperature]).to eq(98.79)
  end
end
