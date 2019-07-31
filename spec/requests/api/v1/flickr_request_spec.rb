require 'rails_helper'

describe "Flickr service" do
  it 'should return background photo' do 
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    result = JSON.parse(response.body)

  end 
end