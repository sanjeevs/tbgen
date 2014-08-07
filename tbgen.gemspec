# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tbgen/version'

Gem::Specification.new do |spec|
  spec.name          = "tbgen"
  spec.version       = Tbgen::VERSION
  spec.authors       = ["sanjeev singh"]
  spec.email         = ["snjvsingh123@gmail.com"]
  spec.summary       = %q{Generates an automated testbench for hdl(verilog) designs.}
  spec.description   = %q{Allows the RTL designer to automatically generate testbench from the top level
                          ports of the design.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "erb"
end
