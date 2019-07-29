require 'rails_helper'

describe 'Geocode gets coordinates from location' do 
  it "should return lat and long" do 
    service = GeocodeService.new("denver, co")

    location = service.get_results

  end
end