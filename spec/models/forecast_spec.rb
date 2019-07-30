require 'rails_helper'

describe 'Forecast object' do 
  it 'can parse through data and return only needed info' do 
    json = File.read('./spec/fixtures/darksky_info_for_denver.rb')
    symbols = JSON.parse(json, symbolize_names: true)
    weather = Forecast.new(symbols)
    expect(weather).to have_key('data')
    expect(weather).to have_key('location')
    expect(weather).to have_key('current_weather')
    expect(weather).to have_key('hourly_weather')
    expect(weather['hourly'].count).to eq(8)
    expect(weather).to have_key('daily_weather')
    expect(weather['daily'].count).to eq(5)
  end
end