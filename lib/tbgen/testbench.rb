module Tbgen
  class Testbench
    class <<self
      attr_accessor :agents, :dut
    end

    def self.render(file="../testbench.erb")
      erb_file = File.expand_path(file, __FILE__)
      File.open(erb_file, 'r') do |f|
        ERB.new(f.read).result(binding)
      end
    end

  end
end

