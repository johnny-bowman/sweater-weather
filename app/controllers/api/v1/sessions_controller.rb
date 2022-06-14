class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user.authenticate(params[:password])
      render json: Api::V1::UserSerializer.new_session(user), status: 200
    end
  end
end
