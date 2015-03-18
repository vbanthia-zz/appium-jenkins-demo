# -*- coding: utf-8 -*-

module ServerManager
  class << self

    def appium_configuration(&block)
      @appium_conf ||= ::AppiumServerConfiguration.new
      yield(@appium_conf) if block_given?
      @appium_conf
    end

    def start_appium_server
      kill_process_at_port(appium_configuration.port)

      cmd = appium_configuration.appium_path
      cmd << Array(appium_configuration.server_flags).map {|flag| " --#{ flag.to_s }" }.join
      cmd << " --port #{ appium_configuration.port }"
      cmd << appium_configuration.server_args.map {|k, v| " --#{ k.to_s } #{ v.to_s }"}.join(' ')

      pid = spawn(cmd, :out => '/dev/null')
      Process.detach(pid)

      sleep 3
    end

    def kill_appium_server
      kill_process_at_port(appium_configuration.port)
    end

    private
    def kill_process_at_port(port)
      process_ids = `lsof -t -i:#{ port }`.split("\n")
      process_ids.each do |process_id|
        `kill #{ process_id }`
      end
    end

  end
end

class AppiumServerConfiguration
  attr_writer :appium_path, :port, :server_flags, :server_args

  def appium_path
    # Assuming, Appium is installed locally using npm.
    @appium_path ||= 'node_modules/.bin/appium'
  end

  def port
    @port ||= '4723'
  end

  def server_flags
    @server_flags ||= []
  end

  def server_args
    @server_args ||= {}
  end
end
