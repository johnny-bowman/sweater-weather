class Route
  attr_reader :start_city, :end_city, :travel_time

  def initialize(data, from, to)
    @start_city = set_start(data, from)
    @end_city = set_end(data, to)
    @travel_time = set_time(data)
  end

  def set_start(data, from)
    if data[:routeError][:errorCode] == 2
      from
    else
      "#{data[:locations].first[:adminArea5]},#{data[:locations].first[:adminArea3]}"
    end
  end

  def set_end(data, to)
    if data[:routeError][:errorCode] == 2
      to
    else
      "#{data[:locations][1][:adminArea5]},#{data[:locations][1][:adminArea3]}"
    end
  end

  def set_time(data)
    if data[:routeError][:errorCode] == 2
      "impossible route"
    else
      data[:formattedTime]
    end
  end
end
