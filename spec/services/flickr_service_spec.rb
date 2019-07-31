require 'rails_helper'

describe 'Flickr service' do 
  it 'should return photos with url' do 
    service = FlickrService.new.get_background_photo("denver")

    expect(service).to be_a Hash
    expect(service).to have_key(:photos)
    expect(service[:photos]).to have_key(:photo)
    expect(service[:photos][:photo].first).to have_key(:title)
    expect(service[:photos][:photo].first).to have_key(:url_o)
    expect(service[:photos][:photo].first[:title]).to eq("Denver skyline")
  end
end
    