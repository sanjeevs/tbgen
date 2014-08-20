class SendDataAgent
  PROPERTIES = [:name, :data_ports, :control_ports]
  PROPERTIES.each { |p| attr_accessor p }

  def initialize(name, data_ports)
    @name = name
    @data_ports = data_ports 
  end

  def render
    erb_file = File.expand_path("../send_data_agent.erb", __FILE__)
    ERB.new(open(erb_file, 'r').read, nil, '>').result(binding)
  end
end


