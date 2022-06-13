class MapFacade
  class << self
    def get_coordinates(location)
      json = MapService.get_coordinates(location)
      Map.new(json[:results][0][:locations].first)
    end
  end
end
