require 'spec_helper'

module Tbgen
  describe Testbench do
    before(:each) do
      user_testbench_code = 
      """
        input_agent =  AsyncInputAgent.new('input1')
        input_agent << dut.input_ports 
        @agents << input_agent
      """
      @testbench_code = "class Testbench; @agents = []\n" + user_testbench_code + "end\n"
      @dut = double("dut")
      Testbench.dut = @dut 
    end

    it "should render hdl testbench" do
      allow(@dut).to receive(:input_ports).and_return([])
      eval(@testbench_code)
      allow(@dut).to receive(:ports).and_return([])
      testbench = Testbench.render
      expect(testbench).to match("module Testbench")
      puts testbench
    end
  end
end
