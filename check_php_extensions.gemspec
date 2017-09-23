# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'check_php_extensions/version'

Gem::Specification.new do |spec|
  spec.name          = "check_php_extensions"
  spec.version       = CheckPhpExtensions::VERSION
  spec.authors       = ["onionpsy"]
  spec.email         = ["patrice.salathe@gmail.com"]

  spec.summary       = 'Sensu plugin for checking if php extensions are loaded'
  spec.description   = 'Sensu plugin for checking if php extensions are loaded'
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.required_ruby_version  = '>= 2.0.0'
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_runtime_dependency 'sensu-plugin',  '~> 2.2'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
 
end
