class ImageService < BaseService
  class << self
    def get_image(location)
      response = conn('https://api.unsplash.com').get("/search/photos?query=#{location}&orientation=landscape&client_id=#{ENV['image_key']}")

      get_json(response)
    end
  end
end
