module Tbgen

  # Agent drives the inputs asynchronously.
  # All inputs are treated as data.

  class AsyncInputAgent
    attr_reader :data_ports, :name, :control_ports

    def initialize(name)
      @name = name
      @xact_name = @name + "_xact"
      @data_ports = []
      @control_ports = []
    end

    def render(path="../async_input_agent.erb")
      erb_file = File.expand_path(path, __FILE__)
      ERB.new(open(erb_file, 'r').read, nil, '>').result(binding)
    end

    def add_data_port(port)
      if data_ports.find_index { |p| p.name == port.name }
        raise ArgumentError, "Port name #{port.name} already exists"
      end
      data_ports << port
    end

    def <<(port)
      if port.instance_of?(Array)
        port.each do |p|
          add_data_port p
        end
      else
        add_data_port port
      end
    end
      
  end

end
