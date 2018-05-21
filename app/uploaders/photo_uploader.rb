# app/uploaders/photo_uploader.rb
class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
   process eager: true  # Force version generation at upload time.

   process convert: 'jpg'

    version :bundle_card do
      process resize_to_fill: [300,200]
    end

    version :showpage do
      cloudinary_transformation quality: :auto, crop: :scale, width: 600, height: 400
    end

    version :avatar_small do
      cloudinary_transformation radius: :max, gravity: :face, width: 30, height: 30, crop: :thumb
    end
end
