require 'spec_helper'

module Tbgen

  describe "New dut" do
    before(:all) do
      @dut = HdlModule.new 
      @dut.name = "fifo"
      @dut.ports = { 'a'=> Port.new("a"), 'b' => Port.new("b") } 
    end
    it "should have name fifo" do
      expect(@dut.name).to eq("fifo")
    end
    it "should have correct number of ports" do
      @dut.ports.size == 2
    end
    it "returns a port on giving a name" do
      expect(@dut.ports['a'].name).to eq('a')
    end
  end
end
