module Tbgen
  class Testbench
    class <<self
      attr_accessor :agents, :dut
    end

    def self.render(file="../testbench.erb")
      erb_file = File.expand_path(file, __FILE__)
      File.open(erb_file, 'r') do |f|
        ERB.new((f.read), nil, '>').result(binding)
      end
    end

    def self.initialize_agents
      Testbench.instance_variables.each do |variable|
        if Testbench.instance_variable_get(variable).is_a? Agent
          @agents << Testbench.instance_variable_get(variable)
        end
      end
    end
  end
end

