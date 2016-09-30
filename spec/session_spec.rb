require "spec_helper"
require 'spec_secrets'

module Mojio
  describe Session do
    include_context "secrets"
    describe "get token" do

      before do
        Mojio.configure do |config|
          # config.api_host = "api.moj.io" #optional
          # config.api_port = ""
          config.app_id = @valid_id
          config.app_secret = @valid_secret
          config.username = @valid_username
          config.password = @valid_password
        end
        Mojio.login
      end

      it "should have an app_id" do
        expect(Mojio.configuration.app_id).not_to eq(nil)
      end

      it "should not get nil" do
        token = Mojio.get_token
        expect(token).not_to eq(nil)
      end
      it "should be a valid token" do
        token = Mojio.get_token
        expect(token).to match(/[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}/)
      end

      it "should not be expired" do
        token = Mojio.get_token
        expect(Mojio.session['expires_at']).to be >= DateTime.now
      end
      it "should extend a soon to expire token" do
        puts "extending session\n\n\n"
        Mojio.session['expires_at'] = DateTime.now + 15.minutes
        puts Mojio.session['expires_at']
        token = Mojio.get_token
        expect(Mojio.session['expires_at']).to be >= DateTime.now + 30.minutes
        puts Mojio.session['expires_at']
      end
    end
  end
end
