module Tbgen

  # Agent drives the inputs asynchronously.
  # All inputs are treated as data.

  class AsyncInputAgent < Agent
  
    def verilog
      @custom_erb_filename = "../async_input_agent.erb"
      render
    end

  end

end
