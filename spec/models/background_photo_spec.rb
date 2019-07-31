require 'rails_helper'

describe "background photo model" do 
  it 'should parse and bring back only id name and url' do 
    params = {:id=>"33823599548",
              :owner=>"35390579@N04",
              :secret=>"eee1c4fc2a",
              :server=>"65535",
              :farm=>66,
              :title=>"Day115_2019",
              :ispublic=>1,
              :isfriend=>0,
              :isfamily=>0,
              :url_o=>"https://live.staticflickr.com/65535/33823599548_94b25d982b_o.jpg",
              :height_o=>"666",
              :width_o=>"2000"}
    photo = BackgroundPhoto.new(params)

    expect(photo.id).to eq("33823599548")
    expect(photo.title).to eq("Day115_2019")
    expect(photo.url).to eq("https://live.staticflickr.com/65535/33823599548_94b25d982b_o.jpg")
  end
end