require 'rails_helper'

describe 'User creation' do 
  it 'should create a user and return api key' do 
    params = {
              "email": "whatever@example.com",
              "password": "password"
              "password_confirmation": "password"
    }
    post '/api/v1/users', params: params
    response = JSON.parse(response.body)
    binding.pry
  end
end