class MapService < BaseService
  class << self
    def get_coordinates(location)
      response = conn('http://www.mapquestapi.com').get("geocoding/v1/address?key=#{ENV['map_key']}&location=#{location}")
      
      get_json(response)
    end
  end
end
