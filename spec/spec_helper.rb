# -*- coding: utf-8 -*-

require 'appium_lib'
require 'capybara-screenshot/rspec'

require 'pry'

# jenkins
Encoding.default_external = 'UTF-8'

# support files
SPEC_ROOT = File.expand_path(File.dirname(__FILE__))
Dir[File.expand_path('support/**/*.rb', SPEC_ROOT)].each { |f| require f }

include ::ServerManager

RSpec.configure do |config|

  config.include ::Screenshot

  config.before(:suite) do
    ServerManager.appium_configuration do |conf|
      conf.server_flags = %i(full-reset)
    end

    ServerManager.start_appium_server

    driver_caps = {
      platformName: :ios,
      deviceName: '',
      newCommandTimeout: '9999', 
      app: File.expand_path('./apps/AppiumJenkinsDemo.app')
    }
    Appium::Driver.new(caps: driver_caps).start_driver
  end

  config.after(:suite) do
    $driver.driver_quit
    ServerManager.kill_appium_server
  end
end
