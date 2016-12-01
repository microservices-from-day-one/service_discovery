# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "service_discovery/version"

Gem::Specification.new do |s|
  s.name        = "service_discovery"
  s.version     = ServiceDiscovery::VERSION
  s.authors     = ["Cloves Carneiro Jr"]
  s.email       = ["ccarneiroj@gmail.com"]
  s.summary     = %q{It's the thing that knows where services endpoints live.}
  s.description = %q{It's the thing that knows where services endpoints live.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'consul-client', '~> 0'
end
