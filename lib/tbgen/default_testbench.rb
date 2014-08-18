class Testbench
  protocol = "async"
  if @dut.ports.match(/clk/) do
   @protocols << ClockProtocol.new("clk", period: "1ns")
   protocol = "sync"
  end 
  if @dut.ports.match(/rst/) do
   @protocols << ResetProtocol.new("rst", active_period: "10ns")
  end 

  if(protocol == "sync")
    @protocols << SyncInputProtocol.new("sync_input", dut.unconnected_inputs)
    @protocols << SyncOutputProtocol.new("sync_output", dut.unconnected_outputs)
  end
  else 
   @protocols << AsyncInputProtocol.new("async_input", dut.unconnected_inputs)
   @protocols << AsyncOutputProtocol.new("async_output", dut.unconnected_outputs)
  end
  
end  
