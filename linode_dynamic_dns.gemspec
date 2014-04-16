# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'linode_dynamic_dns/version'

Gem::Specification.new do |spec|
  spec.name          = "linode_dynamic_dns"
  spec.version       = LinodeDynamicDns::VERSION
  spec.authors       = ["Grier Johnson"]
  spec.email         = ["grierj@gmail.com"]
  spec.summary       = %q{A small script for updating a linode dns record based on your current IP}
  spec.description   = %q{Dyn decided to charge for this functionality, so I wrote a few lines of code to fix it}
  spec.homepage      = "https://github.com/grierj/linode_dynamic_dns"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "linode", "~> 0.7.10"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
