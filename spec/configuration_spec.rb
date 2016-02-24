require "spec_helper"

module Mojio
  describe Configuration do
    describe "#api_host" do
      it "default value is api.moj.io" do
        expect(Configuration.new.api_host).to eq("api.moj.io")
        # Configuration.new.api_host = "api.moj.io"
      end
    end

    describe "#api_host=" do
      it "can set value" do
        config = Configuration.new
        config.api_host = "staging-api.moj.io"
        expect(config.api_host).to eq("staging-api.moj.io")
      end
    end
  end
end