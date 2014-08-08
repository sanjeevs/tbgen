class SendDataAgent
  attr_reader :interface, :xact

  def initialize(interface, xact)
    @interface = interface
    @xact = xact
  end

  def render
    erb_file = File.expand_path("../send_data_agent.erb", __FILE__)
    puts ERB.new(open(erb_file, 'r').read).result(binding)
  end
end


