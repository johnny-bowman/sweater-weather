class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = MapFacade.get_coordinates(params[:location])
    forecast = ForecastFacade.get_forecast(coordinates.lat, coordinates.lng)

    render json: ForecastSerializer.forecast(forecast)
  end
end
