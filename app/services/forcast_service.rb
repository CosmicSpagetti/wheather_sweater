class ForcastService 
  def initialize(location_params) 
    @lat = location_params[:lat]
    @lng =  location_params[:lng]
  end
  
  
  def get_results
    
  end
  private

  def conn
    Farady.new('https://api.darksky.net/forecast/') do |f|
      f.params['exclude'] = 'minutely,alerts,flags' 
      f.adapter Faraday.default_adapter
    end
  end
end