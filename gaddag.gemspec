# encoding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'gaddag'
  spec.version       = '0.1.1'
  spec.authors       = ['Thomas Brus']
  spec.email         = ['thomas.brus@me.com']
  spec.summary       = %q{Implementation of the GADDAG data structure}
  spec.homepage      = 'https://github.com/thomasbrus/gaddag'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'equalizer', '~> 0.0.9'
  spec.add_dependency 'msgpack', '~> 0.5.8'

  spec.add_development_dependency 'yard', '~> 0.8.7'
  spec.add_development_dependency 'inch', '~> 0.4.5'
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'mutant', '~> 0.5.26'
  spec.add_development_dependency 'mutant-rspec', '~> 0.5.26'
  spec.add_development_dependency 'benchmark-ips', '~> 2.0.0'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
end
