# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae-sonar/version'

Gem::Specification.new do |spec|
  spec.name          = 'itamae-sonar'
  spec.version       = ItamaeSonar::VERSION
  spec.authors       = ['tbpgr']
  spec.email         = ['tbpgr@tbpgr.jp']
  spec.summary       = 'Search itamae plugin gems.'
  spec.description   = 'Search itamae plugin gems.'
  spec.homepage      = 'https://github.com/tbpgr/itamae-sonar'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'gems'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
end
