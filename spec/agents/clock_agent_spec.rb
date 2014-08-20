require 'spec_helper'

module Tbgen
  describe ClockAgent do
    before do
      @clock_agent = ClockAgent.new("clock_agent", half_period: 1)
      @clock_agent.clk = Port.new("my_clk")
    end

    describe "#new" do
      it "should have the correct name" do
        expect(@clock_agent.name).to eq "clock_agent"
      end
      it "should have the clk hooked up" do
        expect(@clock_agent.clk.name).to eq "my_clk"
      end
    end

    describe "#render" do
      it "verilog" do
        agent = @clock_agent.verilog
        expect(agent).to match("module clock_agent")
        puts "\n"
        puts agent
      end
    end
  end
end
