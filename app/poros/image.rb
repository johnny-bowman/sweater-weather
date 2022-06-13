class Image
  attr_reader :url, :source

  def initialize(data)
    @url = data[:results].first[:urls][:raw]
    @source = data[:results].first[:user][:name]
  end
end
