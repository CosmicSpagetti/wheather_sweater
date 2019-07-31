require 'rails_helper'

describe "Endpoint" do
  it 'should return background photo', :vcr do 
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(result.first).to have_key(:id)
    expect(result.first[:attributes]).to have_key(:title)
    expect(result.first[:attributes]).to have_key(:url)
  end 
end