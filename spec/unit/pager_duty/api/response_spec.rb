require 'spec_helper'

describe PagerDuty::API::Response do
  describe "total" do
    it "is pulled from the top-level json attribute" do
      described_class.new('{"total": 8}').total.should == 8
    end
  end

  describe "success?" do
    it "is true if the response code of the restclient response is 200" do
      described_class.new(stub_restclient_response(200)).should be_success
    end

    it "is false if the response code of the restclient response is not 200" do
      described_class.new(stub_restclient_response(345)).should_not be_success
    end
  end

  describe "each" do
    it "iterates over returned objects and yields them to the block" do
      pending("still fuzzy on where this knowledge should go")
    end
  end
end
