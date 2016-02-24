require 'spec_helper'
require 'spec_secrets'

describe Mojio do
  include_context "secrets"
  describe "#configure" do
    it "gets a response" do
      token = Mojio.login

      expect(token).not_to be_empty
      # expect(draw).to be_a(Array)
      # expect(draw.size).to eq(10)
    end
    describe "unsuccessful login" do
      before do
        Mojio.configure do |config|
          # config.api_host = "api.moj.io" #optional
          # config.api_port = "" 
          config.app_id = "a2131313a3a6d"
          config.app_secret = "1232312"
          config.username = "bad_user@example.com"
          config.password = "bad_password"
        end
      end

      it "gets an error" do
        response = Mojio.login
        # puts response

        expect(response['error']).not_to be_empty
        # expect(draw).to be_a(Array)
        # expect(draw.size).to eq(10)
      end
    end

    describe "sucessful login" do
      before do
        Mojio.configure do |config|
          # config.api_host = "api.moj.io" #optional
          # config.api_port = "" 
          config.app_id = @valid_id
          config.app_secret = @valid_secret
          config.username = @valid_username
          config.password = @valid_password
        end
        @token = Mojio.login
      end

      it "gets a token" do
        expect(@token['access_token']).to match(/[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}/)
      end

      it "sets the session" do
        expect(Mojio.session['access_token']).to match(/[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}/)
        expect(Mojio.session['token_type']).to eq("bearer")
        expect(Mojio.session['expires_at']).to be >= DateTime.now
        expect(Mojio.session['refresh_token']).to match(/[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}/)
      end
    end
  end
end