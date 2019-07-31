require 'rails_helper'

describe 'User creation' do 
  it 'should create a user and return api key' do 
    params = {
              "email": "whatever@example.com",
              "password": "password",
              "password_confirmation": "password"
    }.to_json
    headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    post '/api/v1/users', params: params, headers: headers


    expect(JSON.parse(response.body)).to have_key('api_key')
    expect(JSON.parse(response.body)['api_key']).to be_a String
  end
end