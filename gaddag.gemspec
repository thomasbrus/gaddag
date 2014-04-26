# encoding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'gaddag'
  spec.version       = '0.0.1'
  spec.authors       = ['Thomas Brus']
  spec.email         = ['thomas.brus@me.com']
  spec.summary       = %q{Implementation of the GADDAG data structure}
  spec.homepage      = 'https://github.com/thomasbrus/gaddag'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'yard', '~> 0.8'
  spec.add_dependency 'equalizer', '~> 0.0.9'
  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
end
