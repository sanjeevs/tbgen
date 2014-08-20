require 'spec_helper'

module Tbgen

  describe HdlModule do
    before(:all) do
      @dut = HdlModule.new 
      @dut.name = "fifo"
      @dut.ports = [Port.new("a", dut_direction: "input"), 
                    Port.new("b", dut_direction: "output")] 
    end
    it "should have name fifo" do
      expect(@dut.name).to eq("fifo")
    end
    it "should have correct number of ports" do
      @dut.ports.size == 2
    end
    it "should have the correct input port" do
      @dut.input_ports[0].name == 'a' 
    end
    it "should have the correct output port" do
      @dut.output_ports[0].name == 'b' 
    end
    it "returns a port on giving a name" do
      expect(@dut['a'].name).to eq('a')
    end
    
  end
end
