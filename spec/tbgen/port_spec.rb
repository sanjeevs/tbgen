require 'spec_helper'

module Tbgen
  describe Port do
    describe "#new" do
      let(:port1) { Port.new("Port1", direction: "output") }
      
      it { expect(port1.name).to eq("Port1") }
      it { expect(port1.direction).to eq("output") }
      it { expect(port1.scalar?).to eq true }
    end

    describe "equality" do
      let(:port1) { Port.new("Port1", direction: "output") }
      let(:port2) { Port.new("Port1", direction: "output") }
      let(:port3) { Port.new("NewName", direction: "output") }
      let(:port4) { Port.new("Port1", direction: "NewDirection") }
      it "should be equal to another port" do
        expect(port1).to eq(port2)
      end
      it "should not be equal if name mismatches" do
        expect(port3).not_to  eq(port2)
      end
      it "should not be equal if direction mismatches" do
        expect(port4).not_to eq(port1)
      end

    end
 
  end
end 

    
