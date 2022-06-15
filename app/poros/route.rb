class Route
  attr_reader :start_city, :end_city, :travel_time

  def initialize(data)
    @start_city = set_start(data)
    @end_city = set_end(data)
    @travel_time = set_time(data)
  end

  def set_start(data)
    "#{data[:locations].first[:adminArea5]},#{data[:locations].first[:adminArea3]}"
  end

  def set_end(data)
    "#{data[:locations][1][:adminArea5]},#{data[:locations][1][:adminArea3]}"
  end

  def set_time(data)
    if data[:routeError][:errorCode] == 2
      "impossible route"
    else
      data[:formattedTime]
    end
  end
end
