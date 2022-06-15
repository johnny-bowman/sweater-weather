class Api::V1::TripController < ApplicationController
  before_action :define_forecast, only: [:create]

  def create
    user = User.find_by(api_key: params[:api_key])
    route = MapFacade.get_route(params[:origin], params[:destination])

    if user
      if route.travel_time == 'impossible route'
        render json: Api::V1::TripSerializer.impossible_trip(route), status: 201
      else
        render json: Api::V1::TripSerializer.possible_trip(route, @forecast), status: 201
      end
    else
      render json: Api::V1::TripSerializer.invalid_key, status: 401
    end
  end

  private

  def trip_params
    params.permit(:origin, :destination)
  end
end
