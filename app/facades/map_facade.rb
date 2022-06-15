class MapFacade
  class << self
    def get_coordinates(location)
      json = MapService.get_coordinates(location)
      Map.new(json[:results][0][:locations].first)
    end

    def get_route(from, to)
      json = MapService.get_route(from, to)
      
    end
  end
end
