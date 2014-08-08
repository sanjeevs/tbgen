require 'spec_helper'

module Tbgen
  describe Testbench do
    describe "#start" do
      let(:output) { double('output') }
      let(:testbench) { Testbench.new(output) }

      it "sends a welcome messsage" do
        output.should_receive(:puts).with("Welcome to Testbench Generator!")
        testbench.start
      end

    end
  end
end
