require 'spec_helper'

module Tbgen
  describe Testbench do
    before(:each) do
      user_testbench_code = 
      """
        @input_agent =  AsyncInputAgent.new('input1')
        @input_agent << dut.input_ports 
      """
      @testbench_code = "class Testbench; @agents = []\n" + user_testbench_code + "end\n"
      @dut = double("dut")
      Testbench.dut = @dut 
    end

    it "should render single agent testbench" do
      allow(@dut).to receive(:input_ports).and_return([])
      eval(@testbench_code)
      allow(@dut).to receive(:ports).and_return([])
      Testbench.initialize_agents
      testbench = Testbench.render
      expect(testbench).to match("module Testbench")
      expect(testbench).to match("dut dut")
      expect(testbench).to match("input1 input1")
      puts "\n"
      puts testbench
    end
    
    it "should render input testbench" do
      allow(@dut).to receive(:input_ports).and_return([Port.new('a')])
      eval(@testbench_code)
      allow(@dut).to receive(:ports).and_return([Port.new('a')])
      Testbench.initialize_agents
      testbench = Testbench.render
      expect(testbench).to match("module Testbench")
    end
  end
end
