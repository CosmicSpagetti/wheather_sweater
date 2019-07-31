require 'rails_helper'

describe 'User creation' do 
  it 'should create a user and return api key' do 
    params = {
              "email": "whatever@example.com",
              "password": "password",
              "password_confirmation": "password"
    }.to_json
    post '/api/v1/users', params: params
    binding.pry
    response = JSON.parse(response.body)

  end
end