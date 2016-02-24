require "mojio/version"
require "mojio/configuration"
require 'httparty'

module Mojio
  class << self
    attr_accessor :configuration
  end
  
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.login
    headers = {
      "Content-Type" => "application/json"
    }
    options = {
      username: configuration.username,
      password: configuration.password,
      client_id: configuration.app_id,
      client_secret: configuration.app_secret,
      grant_type: "password"
    }
    # puts options.inspect
    url = "https://#{configuration.api_host}:#{configuration.api_port}/OAuth2/token"
    # puts url
    response = HTTParty.post( url, { headers: headers, body: options} )
    # puts "Response: #{response}"
    if response['error']
      return response
    else
      return response
    end
  end
  def self.get_vehicles
  end

  def self.get_location(vehicle_id)
  end
end
