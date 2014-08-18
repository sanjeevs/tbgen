module Tbgen
  class Testbench
    class <<self
      attr_accessor :protocols, :dut
    end


    def self.render_hdl_testbench
      erb_file = File.expand_path("../testbench.erb", __FILE__)
      File.open(erb_file, 'r') do |f|
        ERB.new(f.read).result(binding)
      end
    end

  end
end

