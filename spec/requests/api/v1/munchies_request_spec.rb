require 'rails_helper'

describe 'Munchies request spec', :vcr do 
  it 'should return restaurants' do 

    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)[:data] 
    
    expect(result.first[:attributes]).to have_key(:end_city)
    expect(result.first[:attributes]).to have_key(:name)
    expect(result.first[:attributes]).to have_key(:address)
    expect(result.first[:attributes][:end_city]).to eq("Pueblo")
  end
end