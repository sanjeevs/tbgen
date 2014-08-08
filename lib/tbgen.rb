require "tbgen/version"
require 'optparse'
module Tbgen
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
