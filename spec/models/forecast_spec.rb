require 'rails_helper'

describe 'Forecast object' do 
  it 'can parse through data and return only needed info' do 
    json = File.read('./spec/fixtures/darksky_info_for_denver.rb')
    symbols = JSON.parse(json, symbolize_names: true)
    weather = Forecast.new(symbols, {location: "denver"})

    expect(weather.location).to eq('denver')
    expect(weather.current_weather).to have_key(:time)
    expect(weather.current_weather).to have_key(:summary)
    expect(weather.current_weather[:summary]).to eq("Partly Cloudy")
    expect(weather.hourly_weather.first).to have_key(:time)
    expect(weather.hourly_weather.first).to have_key(:temperature)
    expect(weather.hourly_weather.first).to have_key(:icon)
    expect(weather.hourly_weather.first[:temperature]).to eq(91)
    expect(weather.hourly_weather.count).to eq(8)
    expect(weather.daily_weather.first).to have_key(:day)
    expect(weather.daily_weather.first).to have_key(:summary)
    expect(weather.daily_weather.first).to have_key(:icon)
    expect(weather.daily_weather.first).to have_key(:precipitation)
    expect(weather.daily_weather.first).to have_key(:high)
    expect(weather.daily_weather.first).to have_key(:low)
    expect(weather.daily_weather.first.count).to eq(6)
  end
end