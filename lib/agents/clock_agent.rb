module Tbgen

  #Agent that drives clock

  class ClockAgent < Agent
    def verilog
      render "../clock_agent.erb"
    end
  end
end


    
