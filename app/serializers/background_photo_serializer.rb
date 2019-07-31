class BackgroundPhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :url
end
