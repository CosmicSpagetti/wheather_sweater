class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    render json: { api_key: user.api_key }, status: 201 if user.save
    binding.pry
  end

  private 

  def user_params 
    params.permit(:email, :password, :password_confirmation)
  end
end