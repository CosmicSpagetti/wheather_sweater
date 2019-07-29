require 'rails_helper'

describe 'Roadtrip service' do 
  it "should return road trip info like duration" do 
    service = RoadTripService.new('denver', 'pueblo')

    location = service.get_results

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