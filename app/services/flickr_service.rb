class FlickrService

  def get_background_photo(location)
    params = {
      method: 'flickr.photos.search',
      text: "#{location} skyline"
    }
    get_results(params)
  end

  def get_results(params) 
    response = conn.get('', params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn 
    conn = Faraday.new('https://api.flickr.com/services/rest') do |f|
      f.params['api_key'] = ENV['FLICKR_API_KEY']
      f.params['format'] = 'json'
      f.params['nojsoncallback'] = '1'
      f.params['extras'] = 'url_o'
      f.adapter Faraday.default_adapter
    end
  end
end