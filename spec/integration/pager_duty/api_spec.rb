require 'spec_helper'

describe PagerDuty::API do
  before do
    @pagerduty = pagerduty
  end
  describe "given a single request" do
    it "can make subsequent requests freely" do
      result = @pagerduty.incidents.find(
        :since => "2011-07-28",
        :until => "2011-07-29"
      )
      result.success?.should be_true
      response = RestClient.get("https://braintree.pagerduty.com/schedule", :cookies => @pagerduty.cookies)
      response.code.should == 200
    end
  end
end
