class ImageSerializer
  def self.image(data)
    {
      data: {
        type: 'image',
        id: nil,
        attributes: {
          image: {
            image_url: data.url,
            credit: {
              source: data.source
            }
          }
        }
      }
    }
  end
end
