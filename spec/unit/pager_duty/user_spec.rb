require 'spec_helper'

describe PagerDuty::Service do
  describe "top level attributes" do
    [:id,
     :name,
     :html_url
     ].each do |attribute|
      it "gets #{attribute} from the top-level of the init hash" do
        value = rand(10000).to_s
        incident = described_class.new({"#{attribute}" => value})
        incident.send(attribute).should == value
      end
    end
  end
end
