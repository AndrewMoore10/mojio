require "mojio/version"
require "mojio/configuration"
require "mojio/session"
require "mojio/vehicles"
require 'httparty'
require 'active_support'
require 'active_support/all'

module Mojio
  class << self
    attr_accessor :configuration
    attr_accessor :session
  end
  
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.get_token
    if @session == nil || @session['access_token'].empty? || @session['expires_at'] < DateTime.now
      if (response = self.login)['error']
        puts "Error occured logging in #{response.inspect}"
        return nil
      else
        puts "loging success new token set"
      end
    elsif @session['expires_at'] < DateTime.now + 30.minutes
      if (response = self.extend_token['error'])
        puts "Error extending token #{response.inspect}"
      end
    end
    return @session['access_token']
  end

  def self.extend_token
    url = "https://#{configuration.api_host}:#{configuration.api_port}/v1/login/#{configuration.app_id}/session"
    headers = {
      "Content-Type" => "application/json",
      "MojioAPIToken" => @session['access_token']
    }
    options = {
      minutes: 43829
    }
    response = HTTParty.post( url, { headers: headers, query: options} )
    @session['expires_at'] = DateTime.parse(response["ValidUntil"])
    # puts "Response: #{response}"
    return response
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
    puts options.inspect
    url = "https://#{configuration.api_host}:#{configuration.api_port}/OAuth2/token"
    # puts url
    response = HTTParty.post( url, { headers: headers, body: options} )
    # puts "Response: #{response}"
    if response['error']
      return response
    else
      @session = response;
      @session['expires_at'] = DateTime.now + response['expires_in'].to_i.minutes;
      # puts @session['access_token']
      return response
    end
  end
end
