class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: UsersSerializer.new(user), status: 201
    else
      render json: invalid_registration(user), status: 400
    end
  end

  private

  def invalid_registration(user)
    {errors: [{
        status: '400',
        detail: "#{error_message(user.errors)}"
        }]
    }.to_json
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
