class Api::V1::TripSerializer
  class << self
    def possible_trip(route, forecast)
      if forecast[:temp]
        temperature = forecast[:temp]
      else
        temperature = ((forecast[:max_temp] + forecast[:min_temp]) / 2).round(2)
      end

      {
        data: {
          type: 'roadtrip',
          id: nil,
          attributes: {
            start_city: route.start_city,
            end_city: route.end_city,
            travel_time: route.travel_time,
            weather_at_eta: {
              temperature: temperature,
              conditions: forecast[:conditions]
            }
          }
        }
      }
    end

    def impossible_trip(route)
      {
        data: {
          type: 'roadtrip',
          id: nil,
          attributes: {
            start_city: route.start_city,
            end_city: route.end_city,
            travel_time: route.travel_time,
            weather_at_eta: nil
          }
        }
      }
    end

    def invalid_key
      {
        errors: [
          {
            status: 401,
            message: 'invalid api key'
          }
        ]
      }
    end
  end
end
