class Map
  attr_reader :lat, :lng, :location

  def initialize(data)
    @lat = data[:latLng][:lat]
    @lng = data[:latLng][:lng]
    @location = data[:adminArea5]
  end
end
