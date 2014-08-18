module Tbgen
  class Port
    attr_reader :name
    PROPERTIES = [:direction, :vector, :msb, :lsb]
    PROPERTIES.each { |p| attr_accessor p }

    def initialize(name, options={})
      @name = name
      @direction = "input"
      @vector = false
      @msb = 0
      @lsb = 0
      PROPERTIES.each do |p|
        instance_variable_set("@#{p}", options[p]) unless options[p].nil?
      end
    end

    def scalar?
      !vector
    end

    def declaration(type)
      if vector
        if @msb == @lsb
          "#{type}  #{name}[1]" 
        else
          "#{type} [#{msb}:#{lsb}] #{name}"
        end
      else
        "#{type}  #{name}"
      end
    end

    def definition
      if direction == "output"
        declaration "reg"
      else
        declaration "wire"
      end
    end

    def interface_declaration
      declaration @direction
    end

    def ==(other)
      return false unless other.instance_of?(Port)
      @name == other.name && 
      @direction == other.direction && 
      @vector == other.vector && 
      @msb == other.msb && 
      @lsb == other.lsb;
    end
      
  end
end

