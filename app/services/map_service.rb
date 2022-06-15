class MapService < BaseService
  class << self
    def get_coordinates(location)
      response = conn('http://www.mapquestapi.com').get("geocoding/v1/address?key=#{ENV['map_key']}&location=#{location}")

      get_json(response)
    end

    def get_route(from, to)
      response = conn('http://www.mapquestapi.com').get("directions/v2/route?key=#{ENV['map_key']}&from=#{from}&to=#{to}")

      get_json(response)
    end
  end
end
