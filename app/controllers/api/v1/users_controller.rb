class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.save && user_params[:password] == user_params[:password_confirmation]
      @user.api_key = SecureRandom.urlsafe_base64
      render json: UserSerializer.new_user(@user), status: 201
    else
      render json: UserSerializer.creation_error(@user), status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
