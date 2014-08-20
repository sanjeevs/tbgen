require 'spec_helper'

module Tbgen
  describe ResetAgent do
    before do
      @reset_agent = ResetAgent.new("reset_agent", active_interval: 10)
      @reset_agent.reset = Port.new("my_reset")
    end

    describe "#new" do
      it "should have the correct name" do
        expect(@reset_agent.name).to eq "reset_agent"
      end
      it "should have the reset hooked up" do
        expect(@reset_agent.reset.name).to eq "my_reset"
      end
    end

    describe "#render" do
      it "verilog" do
        agent = @reset_agent.verilog
        expect(agent).to match("module reset_agent")
        puts "\n"
        puts agent
      end
    end
  end
end
