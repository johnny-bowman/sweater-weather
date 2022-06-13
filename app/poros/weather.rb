class Weather
  attr_reader :id, :current, :hourly, :daily

  def initialize(data)
    @id = nil
    @current = format_current(data[:current])
    @hourly = format_hourly(data[:hourly][0..7])
    @daily = format_daily(data[:daily][0..4])
  end

  def format_current(current_data)
    {
      datetime: Time.zone.at(current_data[:dt]).strftime("%T %Z, %D"),
      sunrise: Time.zone.at(current_data[:sunrise]).strftime("%T %Z, %D"),
      sunset: Time.zone.at(current_data[:sunset]).strftime("%T %Z, %D"),
      temp: current_data[:temp],
      feels_like: current_data[:feels_like],
      humidity: current_data[:humidity],
      uvi: current_data[:uvi],
      visibility: current_data[:visibility],
      conditions: current_data[:weather].first[:description],
      icon: current_data[:weather].first[:icon]
    }
  end

  def format_hourly(hourly_data)
    hourly_data.map do |hour|
      {
        time: Time.zone.at(hour[:dt]).strftime('%T %Z'),
        temp: hour[:temp].to_f,
        conditions: hour[:weather][0][:description],
        icon: hour[:weather][0][:icon]
      }
    end
  end

  def format_daily(daily_data)
    daily_data.map do |day|
      {
        date: Time.zone.at(day[:dt]).strftime('%F'),
        sunrise: Time.zone.at(day[:sunrise]),
        sunset: Time.zone.at(day[:sunset]),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
      }
    end
  end
end
