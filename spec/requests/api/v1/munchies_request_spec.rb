require 'rails_helper'

describe 'Munchies request spec' do 
  it 'should return restaurants' do 

    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful

    result = JSON.parse(response.body) 

  end
end