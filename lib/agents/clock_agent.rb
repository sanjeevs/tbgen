module Tbgen

  #Agent that drives clock

  class ClockAgent < Agent

    PROPERTIES = [:half_period, :clk]
    PROPERTIES.each { |p| attr_accessor p }

    def initialize(name, options={})
      super(name)
      invalid_properties = options.keys - PROPERTIES
      raise ArgumentError, "Invalid clk property '#{invalid_properties.join(',')}'" unless invalid_properties.empty?
      
      PROPERTIES.each do |p|
        instance_variable_set("@#{p}", options[p]) unless options[p].nil?
      end
 
    end

    def verilog
      raise ArgumentError, "Clk port not connected" unless @clk
      @control_ports[0] = clk 
      @custom_erb_filename = "../clock_agent.erb"
      render
    end

  end
end


    
