# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  Rails.logger.debug '*' * 50
  Rails.logger.debug store_path
  Rails.logger.debug '*' * 50

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
