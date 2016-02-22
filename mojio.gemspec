# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mojio/version'

Gem::Specification.new do |spec|
  spec.name          = "mojio"
  spec.version       = Mojio::VERSION
  spec.authors       = ["AndrewMoore10"]
  spec.email         = ["Andrew.Moore@10news.com"]
  spec.summary       = %q{This is a gem to interface with a mojio vehicle OBD-II device}
  spec.description   = %q{This is a gem to interface with a mojio vehicle OBD-II device}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "httparty"
end
