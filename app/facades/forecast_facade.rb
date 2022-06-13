class ForecastFacade
  class << self
    def get_forecast(lat, lon)
      json = ForecastService.get_forecast(lat, lon)
      Forecast.new(json)
    end
  end
end
