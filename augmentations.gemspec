# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'augmentations/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-augmentations"
  spec.version       = Augmentations::VERSION
  spec.authors       = ["Michael Cizl"]
  spec.email         = ["michael@mic-city.de"]

  spec.summary       = %q{Gemified version of Henrik Nyh's augmentations}
  spec.homepage      = "https://github.com/mcizl/augmentations"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
end
