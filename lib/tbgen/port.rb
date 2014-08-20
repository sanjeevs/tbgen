module Tbgen
  # Represent the verilog port construct.
  # 
  class Port
    # A port must have a unique name.
    attr_reader :name

    # Direction is with respect to the dut.
    PROPERTIES = [:dut_direction, :vector, :msb, :lsb]
    PROPERTIES.each { |p| attr_accessor p }

    def initialize(name, options={})
      @name = name
      @dut_direction = "input"
      @vector = false
      @msb = 0
      @lsb = 0

      invalid_properties = options.keys - PROPERTIES
      raise ArgumentError, "Invalid property '#{invalid_properties.join(',')}'" unless invalid_properties.empty?
      
      PROPERTIES.each do |p|
        instance_variable_set("@#{p}", options[p]) unless options[p].nil?
      end
    end

    # A port is either scalar or vector.
    def scalar?
      !vector
    end

    # A port decl depending on the type of the port.
    def dut_definition
      if dut_direction == "output"
        vlg_definition "reg"
      else
        vlg_definition "wire"
      end
    end
   
    # A port decl on the agent. 
    def reverse_dut_definition
      if dut_direction == "output"
        vlg_definition "wire"
      else
        vlg_definition "reg"
      end
    end

    # A port type decl
    def dut_type_declaration
      if vector
        "#{dut_direction} [#{msb}:#{lsb}] #{name}"
      else
        "#{dut_direction} #{name}"
      end
    end

    def reverse_dut_type_declaration
      if dut_direction == "output"
        "input #{name}"
      elsif dut_direction == "input"
        "output #{name}"
      else
        dut_type_declaration
      end
    end

    # Suppy the correct type for writing the definition
    def vlg_definition(type)
      if vector
          "#{type} [#{msb}:#{lsb}] #{name}"
      else
        "#{type} #{name}"
      end
    end

    # A port is equal if the attribute match.
    def ==(other)
      return false unless other.instance_of?(self.class)
      @name == other.name and 
      @dut_direction == other.dut_direction and 
      @vector == other.vector and 
      @msb == other.msb and 
      @lsb == other.lsb;
    end

    # For hash table. Maybe compare just the name ?
    alias eql? ==

    def hash
      @name.hash ^ @dut_direction.hash ^ @vector.hash ^ @msb.hash ^ @lsb.hash
    end  

  end
end

