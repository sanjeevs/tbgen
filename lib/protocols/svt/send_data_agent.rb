class SendDataAgent
  attr_reader :name, :data_ports

  def initialize(name, data_ports)
    @name = name
    @data_ports = data_ports 
  end

  def render
    erb_file = File.expand_path("../send_data_agent.erb", __FILE__)
    ERB.new(open(erb_file, 'r').read, nil, '>').result(binding)
  end
end


