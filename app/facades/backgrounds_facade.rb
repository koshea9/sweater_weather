class BackgroundsFacade
  def self.get_image(location)
    image_data = BackgroundService.get_background_image(location)
    Background.new(image_data, location)
  end
end
