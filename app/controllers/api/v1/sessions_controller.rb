class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UsersSerializer.new(user), status: 200
    else
      render json: { errors: [{
        status: '401',
        detail: "Invalid credentials"
      }] }, status: 401
    end
  end
end
