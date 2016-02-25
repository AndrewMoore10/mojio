require "spec_helper"
require 'spec_secrets'

module Mojio
  describe "Vehicles --" do
  include_context "secrets"
    before do
      Mojio.configure do |config|
        # config.api_host = "api.moj.io" #optional
        # config.api_port = "" 
        config.app_id = @valid_id
        config.app_secret = @valid_secret
        config.username = @valid_username
        config.password = @valid_password
      end
    end
    describe "get all" do
      it "return a list of vehicles" do
        expect(Mojio.get_vehicles).not_to eq(nil)
      end
    end

    describe "vehicle" do
      before do
        @v_id = "55dd6847-5d0b-4602-9905-4105ab9ce98e"
      end
      it "returns a vehicle's general information" do
        expect(Mojio.get_vehicle(@v_id) ).not_to eq(nil)
        expect(Mojio.get_vehicle(@v_id)['Type']).to eq("Vehicle")
      end
      it "returns a vehicle's details" do
        expect(Mojio.get_vehicle_details(@v_id) ).not_to eq(nil)
      end
      it "returns a vehicle's events" do
        expect(Mojio.get_vehicle_events(@v_id) ).not_to eq(nil)
      end
      it "returns a vehicle's trip" do
        expect(Mojio.get_vehicle_trips(@v_id) ).not_to eq(nil)
      end
      it "returns a vehicle's diagnostics" do
        expect(Mojio.get_vehicle_diags(@v_id) ).not_to eq(nil)
      end
    end

    # before do

    # end

    # it "should have an app_id" do
    #   expect(Mojio.configuration.app_id).not_to eq(nil)
    # end

    # it "should not get nil" do
    #   token = Mojio.get_token
    #   expect(token).not_to eq(nil)
    # end
    # it "should be a valid token" do
    #   token = Mojio.get_token
    #   expect(token).to match(/[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}/)
    # end

    # it "should not be expired" do
    #   token = Mojio.get_token
    #   expect(Mojio.session['expires_at']).to be >= DateTime.now
    # end
    # it "should refresh a soon to expire token" do
    #   Mojio.session['expires_at'] = DateTime.now + 15.minutes
    #   puts Mojio.session['expires_at']
    #   token = Mojio.get_token
    #   expect(Mojio.session['expires_at']).to be >= DateTime.now + 30.minutes
    #   puts Mojio.session['expires_at']
    # end
  end
end