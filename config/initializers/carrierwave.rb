config_file = File.join(Rails.root, 'config', 'carrierwave.yml')
config = YAML.load(File.open(config_file))[Rails.env]

# FIXME
if config["storage"] == "s3"
  CarrierWave.configure do |conf|
    conf.storage = :fog
    conf.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: config["access_key_id"],
      aws_secret_access_key: config["secret_access_key"],
      region: config["region"],
    }
    conf.fog_directory = config["bucket"]
  end
elsif config["storage"] == "file"
  CarrierWave.configure do |conf|
    conf.storage = :file

    if config["enable_processing"].nil? or config["enable_processing"] == true
      conf.enable_processing = true
    else
      conf.enable_processing = false
    end
  end
end
