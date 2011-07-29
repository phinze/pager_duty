require 'spec_helper'

describe PagerDuty::API::Users do
  describe "list" do
    it "returns a hash of user ids by email" do
      ids = pagerduty.users.list
      ids.should have_at_least(1).item
    end
  end
end
