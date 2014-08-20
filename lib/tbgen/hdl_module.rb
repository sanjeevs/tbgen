module Tbgen
  # Describe a verilog module.
  # A module has a name and an array of ports indexed by name.

  class HdlModule
    attr_accessor(:name, :ports)
    
    def initialize()
      @ports = [] 
    end

    def [](index)
      if index.instance_of?(String)
        index = ports.index { |p| p.name == index }
      end
      @ports[index]
    end

    def input_ports
      @ports.select { |p| p.dut_direction == "input" }
    end 
    
    def output_ports
      @ports.select { |p| p.dut_direction == "output" }
    end 
    
  end

end

