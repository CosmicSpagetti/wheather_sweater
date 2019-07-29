require 'rails_helper'

describe 'Forecast service returns' do 
  it 'should return json of forecasted weather for location' do 
    service = ForcastService.new({:lat=>39.7392358, :lng=>-104.990251})

    weather = service.get_results[:results]

    expect(weather).to have_key(:latitude)
    expect(weather).to have_key(:longitude)
  end
end