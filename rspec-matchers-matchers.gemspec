# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec-matchers-matchers/version'

Gem::Specification.new do |gem|
  gem.name          = 'rspec-matchers-matchers'
  gem.version       = Rspec::Matchers::Matchers::VERSION
  gem.authors       = ['Marco Sandrini']
  gem.email         = ['nessche@gmail.com']
  gem.description   = %q{RSpec custom matchers to spec your custom matchers}
  gem.summary       = %q{RSpec custom matchers to spec your custom matchers}
  gem.homepage      = 'https://github.com/nessche/rspec-matchers-matchers'

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec', '>= 2.12.0'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'simplecov'
end
