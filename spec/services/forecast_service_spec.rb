require 'rails_helper'

describe 'Forecast service returns' do 
  it 'should return json of forecasted weather for location' do 
    service = ForecastService.new({:lat=>39.7392358, :lng=>-104.990251})

    weather = service.get_forecast_results

    binding.pry
    expect(weather).to have_key(:latitude)
    expect(weather[:latitude]).to eq(39.7392358)
    expect(weather).to have_key(:longitude)
    expect(weather[:longitude]).to eq(-104.990251)
    expect(weather).to have_key(:currently)
    expect(weather).to have_key(:daily)
    expect(weather).to have_key(:hourly)
  end
end