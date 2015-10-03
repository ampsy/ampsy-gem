# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ampsy/version'

Gem::Specification.new do |spec|
  spec.name          = "ampsy"
  spec.version       = Ampsy::VERSION
  spec.authors       = ["Anton Rogov"]
  spec.email         = ["anton@blackbits.pro"]

  spec.summary       = %q{Ampsy API wrapper}
  spec.description   = %q{Ampsy API wrapper}
  spec.homepage      = "http://github.com/fliptu/ampsy-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "httparty", "~> 0.13"
end
