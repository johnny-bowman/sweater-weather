class ImageService < BaseService
  class << self
    def get_image(location)
      response = conn('https://api.unsplash.com').get("/search/photos?query=#{location}&client_id=#{ENV['image_key']}")

      get_json(response)
    end
  end
end
