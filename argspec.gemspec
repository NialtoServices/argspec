# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'argspec/constants'

Gem::Specification.new do |spec|
  spec.name          = 'argspec'
  spec.version       = ArgumentSpecification::VERSION
  spec.authors       = ['Nialto Services']
  spec.email         = ['support@nialtoservices.co.uk']

  spec.summary       = %q{Argument Validation Checks}
  spec.description   = %q{RSpec style(ish) checks for arguments}
  spec.homepage      = 'https://rubygems.org/gems/argspec'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',       '~> 1.11'
  spec.add_development_dependency 'rake',          '~> 10.0'
  spec.add_development_dependency 'rspec',         '~> 3.0'
end
