class Api::V1::BackgroundsController < ApplicationController
  def show
    binding.pry
    photo = BackgroudPhoto.new(BackgroundService.new(params[:location]).get_results)
    render json: BackgroundPhotoSerializer.new(BackgroudPhoto.new(photo))
  end 
end