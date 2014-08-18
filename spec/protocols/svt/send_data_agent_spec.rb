require 'spec_helper'

module Tbgen
  describe SendDataAgent do
    describe '#new' do
      before do
        @send_data_agent = SendDataAgent.new("my_interface1",       
          [
           Port.new('a', direction: "output"),
           Port.new('b', direction: "output"),
          ])
      end
      it "should render the driver" do
        driver = @send_data_agent.render
        expect(driver).to match(/module my_interface1_agent/)
        expect(driver).to match(/my_interface1_xact xact/)
        puts driver
      end
    end
  end
end

