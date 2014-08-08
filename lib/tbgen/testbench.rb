module Tbgen
  class Testbench
    def initialize(output)
      @output = output
    end

    def start
      @output.puts "Welcome to Testbench Generator!"
      options = {}
      option_parser = OptionParser.new do |opts|
        opts.on("-t", "--tb") do |tb|
          options[:tb] = tb
        end
    
        opts.on("--svt") do
          options[:svt] = true
        end
      end 
    end
  end
end

