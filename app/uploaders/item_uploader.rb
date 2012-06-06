# encoding: utf-8
class ItemUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :normal do
    process resize_to_fit: [700, 700]
  end

  version :thumb do
    process resize_to_fit: [300, 300]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

end
