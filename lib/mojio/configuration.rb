module Mojio
  class Configuration
    attr_accessor :api_host
    attr_accessor :api_port
    attr_accessor :app_id
    attr_accessor :app_secret
    attr_accessor :username
    attr_accessor :password

    def initialize
      @api_host = "api.moj.io"
      @api_port = "443"
    end
  end
end