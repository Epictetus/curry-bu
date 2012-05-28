require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
  require 'factory_girl'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec

    config.include LoginMacros

    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    config.use_transactional_fixtures = true

    config.infer_base_class_for_anonymous_controllers = false

    config.formatter = 'Growl::RSpec::Formatter'

    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
    end

    config.before(:all) do
      if defined?(CarrierWave)
        CarrierWave::Uploader::Base.descendants.each do |klass|
          next if klass.anonymous?
          klass.class_eval do
            def cache_dir
              "#{Rails.root}/spec/support/uploads/tmp"
            end

            def store_dir
              "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
            end
          end
        end
      end
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:all) do
      if Rails.env.test?
        FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"])
      end
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

  end
end

Spork.each_run do
end
