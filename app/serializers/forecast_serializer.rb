class ForecastSerializer
  include JSONAPI::Serializer

  def forecast(data)
    {
      data: {
        id: nil,
        type: 'forecast',
        attributes: {
          current_weather: {
            datetime: data[:current].datetime,
            sunrise: data[:current].sunrise,
            sunset: data[:current].sunset,
            temperature: data[:current].temp,
            feels_like: data[:current].feels_like,
            humidity: data[:current].humidity,
            uvi: data[:current].uvi,
            visibility: data[:current].visibility,
            conditions: data[:current].conditions,
            icon: data[:current].icon
          },
          daily_weather:
          data[:daily].map do |dw|
            {
              date: dw.date,
              sunrise: dw.sunrise,
              sunset: dw.sunset,
              max_temp: dw.max_temp,
              min_temp: dw.min_temp,
              conditions: dw.conditions,
              icon: dw.icon
            }
          end,
          hourly_weather:
          data[:hourly].map do |hw|
            {
              time: hw.time,
              temperature: hw.temp,
              conditions: hw.conditions,
              icon: hw.icon
            }
          end
        }
      }
    }
  end
end
