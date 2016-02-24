module Mojio
  class Session
    attr_accessor :access_token
    attr_accessor :expires_at
    attr_accessor :refresh_token
    attr_accessor :token_type

    def initialize
      @api_host = "api.moj.io"
      @api_port = "443"
    end
  end
end