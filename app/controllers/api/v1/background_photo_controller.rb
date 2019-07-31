class Api::V1::BackgroundPhotoController < ApplicationController
  def show
    render json: BackgroundPhotoSerializer.new(background_photo)
  end 

  private 

  def flickr_service
    @_flicker_service ||= FlickrService.new.get_background_photo(params[:location])
  end

  def background_photo
    flickr_service[:photos][:photo].map do |photo|
      BackgroundPhoto.new(photo)
    end
  end
end