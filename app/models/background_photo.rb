class BackgroundPhoto 
  attr_reader :id,
              :title, 
              :url
  def initialize(photo)
    @id = photo[:id]
    @title = photo[:title]
    @url = photo[:url_o]
  end 
end