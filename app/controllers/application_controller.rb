class ApplicationController < ActionController::API
  def define_forecast
    if travel_time > 7
      @forecast = full_forecast.daily[travel_time / 24]
    else
      @forecast = full_forecast.hourly[travel_time - 1]
    end
  end

  def full_forecast
    coordinates = MapFacade.get_coordinates(params[:destination])
    full_forecast = ForecastFacade.get_forecast(coordinates.lat, coordinates.lng)
  end

  def travel_time
    route = MapFacade.get_route(params[:origin], params[:destination])
    travel_time = route.travel_time.to_i
  end
end
