# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qt1070/version'

Gem::Specification.new do |spec|
  spec.name          = "qt1070"
  spec.version       = Qt1070::VERSION
  spec.authors       = ["Sille Van Landschoot"]
  spec.email         = ["info@sillevl.be"]

  spec.summary       = %q{QT1070 capacitive touch sensor library for Ruby}
  spec.description   = %q{QT1070 capacitive touch sensor library for Ruby}
  spec.homepage      = "https://github.com/sillevl/ruby-qt1070"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  
  spec.add_dependency "i2c", "~> 0.4"
end
