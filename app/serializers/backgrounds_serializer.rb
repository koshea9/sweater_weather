class BackgroundsSerializer
  include FastJsonapi::ObjectSerializer
  set_type "image"
  attributes :image, :credit, :attribution
end
