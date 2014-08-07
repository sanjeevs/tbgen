require 'spec_helper'

describe SendDataAgent do
  describe '#new' do
    before do
      interface = double('interface')
      xact = double('xact') 
      @send_data_agent = SendDataAgent.new(interface, xact)
    end
    it "should render the driver" do
      @send_data_agent.interface.should_receive(:name).and_return('my_interface')
      
      @send_data_agent.xact.should_receive(:name).and_return('my_xact')
      @send_data_agent.interface.should_receive(:each).and_yield('a')
      @send_data_agent.render
    end
  end
end

