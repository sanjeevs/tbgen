require 'spec_helper'

module Tbgen
  describe AsyncInputAgent do
    describe '#render' do
      before do
        @async_input_agent = AsyncInputAgent.new("my_input1")       
        @async_input_agent << Port.new('a', dut_direction: "input")
        @async_input_agent << Port.new('b', dut_direction: "input")
      end
      it "should have the correct name" do
        expect(@async_input_agent.name).to eq "my_input1"
      end
      it "should have the correct number of data ports" do
        expect(@async_input_agent.data_ports.length).to eq 2
      end
      it "should have the correct name of data port[0]" do
        expect(@async_input_agent.data_ports[0].name).to eq "a" 
      end
      it "should have the correct name of data port[1]" do
        expect(@async_input_agent.data_ports[1].name).to eq "b" 
      end
      it "should fail with duplicate port name" do
        expect { @async_input_agent << Port.new('a') }.to raise_error
      end
      it "should create the verilog" do
        driver = @async_input_agent.render
        expect(driver).to match(/module my_input1/)
        expect(driver).to match(/my_input1_xact xact/)
        puts driver
      end
    end
  end
end

