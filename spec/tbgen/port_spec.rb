require 'spec_helper'

module Tbgen
  describe Port do
    let(:port1) { Port.new("Port1", dut_direction: "output") }
    let(:port2) { Port.new("Port1", dut_direction: "output") }
    let(:port3) { Port.new("NewName", dut_direction: "output") }
    let(:port4) { Port.new("Port1", dut_direction: "NewDirection") }
    let(:port4) { Port.new("Port4", dut_direction: "input", vector: true, 
                            msb: 10, lsb: 6) }

    describe "#new" do
      # By default assume a scalar port  
      it { expect(port1.name).to eq("Port1") }
      it { expect(port1.dut_direction).to eq("output") }
      it { expect(port1.scalar?).to eq true }
    end

    describe "#invalid_new" do
      it "should throw an exception" do
        expect {Port.new("InvalidPort", direction: "output")}.to raise_error
      end
    end

    describe "equality" do
      # All attributes must match  for port to be equal
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

    describe "hash key" do
      # Ports can be used as hash key
      before(:all) do
        @h1 = {}
        @h1[Port.new("Port1", dut_direction: "output")] = "Hello"
      end
      it "should be able to find the object" do
        expect(@h1[Port.new("Port1", dut_direction: "output")]).to eq "Hello"
      end  
    end
    
    describe "dut declaration of output" do
      it { expect(port1.dut_type_declaration).to eq "output Port1" }
    end

    describe "dut definiton of output" do
      it { expect(port1.dut_definition).to eq "reg Port1" }
    end

    describe "dut vector declaration of input" do
      it { expect(port4.dut_type_declaration).to eq "input [10:6] Port4" }
    end

    describe "dut vector definiton of input" do
      it { expect(port4.dut_definition).to eq "wire [10:6] Port4" }
    end

    describe "reverse dut definiton" do
      it { expect(port1.reverse_dut_definition).to eq "wire Port1" }
    end
     
  end
end 

    
