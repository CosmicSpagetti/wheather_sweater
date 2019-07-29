require 'rails_helper'

describe 'Geocode gets coordinates from location' do 
  it "should return lat and long" do 
    service = GeocodeService.new("denver, co")

    location = service.get_results[:results]

    expect(location[0]).to have_key(:geometry)
    expect(location[0][:geometry]).to have_key(:location)
    expect(location[0][:geometry][:location]).to have_key(:lat)
    expect(location[0][:geometry][:location]).to have_key(:lng)
    expect(location[0][:geometry][:location][:lat]).to eq(39.7392358)
    expect(location[0][:geometry][:location][:lng]).to eq(-104.990251)
  end
end