# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "straight-jacket"
  gem.version       = '0.0.1'
  gem.authors       = ["Myles Megyesi"]
  gem.email         = ["myles.megyesi@gmail.com"]
  gem.description   = 'Route constrainer for Rails'
  gem.summary       = 'Route constrainer for Rails'

  gem.files         = Dir['lib/**/*.rb']
  gem.require_paths = ['lib']

  gem.add_runtime_dependency     'activesupport', '~> 4.0.0'
  gem.add_development_dependency 'actionpack',    '~> 4.0.0'
  gem.add_development_dependency 'rack',          '~> 1.5.2'
  gem.add_development_dependency 'rake',          '~> 10.1.0'
  gem.add_development_dependency 'rspec',         '~> 2.14.1'
end
