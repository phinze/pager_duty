require 'spec_helper'

describe PagerDuty::ScheduleEntry do
  describe "top level attributes" do
    [:start,
     :end
     ].each do |attribute|
      it "gets #{attribute} from the top-level of the init hash" do
        value = rand(10000).to_s
        incident = described_class.new({"#{attribute}" => value})
        incident.send(attribute).should == value
      end
    end
  end

  describe "delegated attributes" do
    it "delegates user sub-hash to PagerDuty::User" do
      described_class.new({"user" => {}}).user.should be_a PagerDuty::User
    end
  end
end
