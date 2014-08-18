require 'spec_helper'

module Tbgen
  describe Testbench do
    before(:all) do
      user_testbench_code = """
      class Testbench
        @protocols = %w{a b c}
      end
      """
      dut = HdlModule.new
      user_dut_code = """
      dut.name = 'fifo'
      dut.ports['p1'] = Port.new('p1', direction: 'input')
      dut.ports['p2'] = Port.new('p2', direction: 'output')
      """
      eval(user_testbench_code)
      eval(user_dut_code)
      Testbench.dut = dut 
    end

    it "should have protocols" do
      expect(Testbench.protocols).to match_array(%w{a b c})
    end
    
    it "should have render hdl testbench" do
      tb = Testbench.render_hdl_testbench
      
    end
  end
end
