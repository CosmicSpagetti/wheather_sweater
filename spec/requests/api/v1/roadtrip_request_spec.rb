require 'rails_helper'

describe 'Road Trip', :vcr do 
  it 'should return weather at place of arrival and trip duration' do 
    User.create!(
      "email": "billy@example.com",
      "password": "blah"
    )

    params = {
              "origin": "Denver,CO", 
              "destination": "Pueblo,CO",
              "api_key": User.last.api_key
    }.to_json

    headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

    post '/api/v1/road_trips', params: params, headers: headers

    result = JSON.parse(response.body, symbolize_names: true )

    expect(result[:data][:attributes]).to have_key(:weather)
    expect(result[:data][:attributes]).to have_key(:trip_duration)
    expect(result[:data][:attributes]).to have_key(:location)
    expect(result[:data][:attributes][:weather]).to have_key(:temperature)
    expect(result[:data][:attributes][:weather]).to have_key(:summary)
  end

  it 'should return status 401 if wrong api key sent', :vcr do 
    User.create!(
      "email": "billy@example.com",
      "password": "blah"
    )

    params = {
              "origin": "Denver,CO", 
              "destination": "Pueblo,CO",
              "api_key":  "1" 
    }.to_json

    headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

    post '/api/v1/road_trips', params: params, headers: headers

    result = JSON.parse(response.body, symbolize_names: true )

    expect(response.status).to eq(401)
  end
end