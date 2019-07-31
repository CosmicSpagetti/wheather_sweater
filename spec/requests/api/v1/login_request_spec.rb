require 'rails_helper'

describe 'Can send request to login' do 
  it 'should log user in and their api key' do 
    User.create!(
      "email": "billy@example.com",
      "password": "blah"
    )

    params = {
              "email": "billy@example.com",
              "password": "blah"
    }.to_json
    headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

    post '/api/v1/sessions', params: params, headers: headers

    expect(JSON.parse(response.body)).to have_key('api_key')
    expect(JSON.parse(response.body)['api_key']).to be_a String
  end

  it 'sends wrong password' do 
    User.create!(
      "email": "billy@example.com",
      "password": "blah"
    )

    params = {
              "email": "billy@example.com",
              "password": "bloop"
    }.to_json
    headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

    post '/api/v1/sessions', params: params, headers: headers

    expect(JSON.parse(response.body)).to have_key('error')
    expect(JSON.parse(response.body)['error']).to eq('Nope')
  end
end