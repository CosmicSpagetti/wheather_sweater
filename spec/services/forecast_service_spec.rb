require 'rails_helper'

describe 'Forecast service returns' do 
  it 'should return json of forecasted weather for location' do 
    service = ForcastService.new({:lat=>39.7392358, :lng=>-104.990251})

    weather = service.get_forecast_results

    expect(weather).to have_key(:latitude)
    expect(weather[:latitude]).to eq(39.7392358)
    expect(weather).to have_key(:longitude)
    expect(weather[:longitude]).to eq(-104.990251)
  end
end