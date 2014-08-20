module Tbgen

  #Agent that drives clock

  class ResetAgent < Agent

    PROPERTIES = [:active_interval, :active_value, :reset]
    PROPERTIES.each { |p| attr_accessor p }

    def initialize(name, options={})
      super(name)
      @active_value = 1
      invalid_properties = options.keys - PROPERTIES
      raise ArgumentError, "Invalid reset property '#{invalid_properties.join(',')}'" unless invalid_properties.empty?
      
      PROPERTIES.each do |p|
        instance_variable_set("@#{p}", options[p]) unless options[p].nil?
      end
 
    end

    def verilog
      raise ArgumentError, "Reset port is not connected" unless @reset
      @control_ports[0] = reset 
      @custom_erb_filename = "../reset_agent.erb"
      render
    end

  end
end


    
  
