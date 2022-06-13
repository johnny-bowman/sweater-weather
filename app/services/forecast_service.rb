class ForecastService < BaseService
  class << self
    def get_forecast(lat, lon)
      response = conn('https://api.openweathermap.org').get("data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,alerts&appid=#{ENV['weather_key']}")

      get_json(response)
    end
  end
end
