class YelpRestaurant
  attr_reader :id,
              :address,
              :name, 
              :end_city
  def initialize(yelp_json)
    @id = yelp_json[:id]
    @name = yelp_json[:name]
    @address = yelp_json[:location][:address1]
    @end_city = yelp_json[:location][:city]
  end
end