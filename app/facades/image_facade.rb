class ImageFacade
  class << self
    def get_image(location)
      json = ImageService.get_image(location)
      Image.new(json)
    end
  end
end
