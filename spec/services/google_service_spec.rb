require 'rails_helper'

describe 'Roadtrip service',:vcr do 
  it "should return road trip info like duration" do 
    location = GoogleService.get_directions('denver', 'pueblo')

    expect(location).to have_key(:routes)
    expect(location[:routes].first).to have_key(:legs)
    expect(location[:routes].first[:legs].first).to have_key(:distance)
    expect(location[:routes].first[:legs].first).to have_key(:end_address)
    expect(location[:routes].first[:legs].first).to have_key(:duration)
    expect(location[:routes].first[:legs].first[:distance][:text]).to eq("114 mi")
    expect(location[:routes].first[:legs].first[:end_address]).to eq("Pueblo, CO, USA")
    expect(location[:routes].first[:legs].first[:duration][:text]).to eq("1 hour 47 mins")
  end
end
describe 'Geocode gets coordinates from location', :vcr do 
  it "should return lat and long" do 
    location = GoogleService.get_geocode("denver, co")[:results]

    expect(location[0]).to have_key(:geometry)
    expect(location[0][:geometry]).to have_key(:location)
    expect(location[0][:geometry][:location]).to have_key(:lat)
    expect(location[0][:geometry][:location]).to have_key(:lng)
    expect(location[0][:geometry][:location][:lat]).to eq(39.7392358)
    expect(location[0][:geometry][:location][:lng]).to eq(-104.990251)
  end
end