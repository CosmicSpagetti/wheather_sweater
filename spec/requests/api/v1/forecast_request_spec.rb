require 'rails_helper'

describe "Geocoding and forecast api", :vcr do
  it "Returns info on current weather" do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result).to have_key('data')
    expect(result['data']['attributes']).to have_key('location')
    expect(result['data']['attributes']).to have_key('current_weather')
    expect(result['data']['attributes']).to have_key('hourly_weather')
    expect(result['data']['attributes']['hourly_weather'].count).to eq(8)
    expect(result['data']['attributes']).to have_key('daily_weather')
    expect(result['data']['attributes']['daily_weather'].count).to eq(5)
  end
end