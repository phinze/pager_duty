require 'spec_helper'

describe PagerDuty::API::Incidents do
  describe "find" do
    it "returns incidents with incident numbers" do
      result = pagerduty.incidents.find(
        :since => "2011-07-28",
        :until => "2011-07-29"
      )
      result.success?.should be_true
      result.should have_at_least(1).incident
      result.each do |incident|
        incident.incident_number.should_not be_nil
      end
    end
  end
end
