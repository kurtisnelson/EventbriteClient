# -*- encoding: utf-8 -*-
require File.expand_path('../lib/EventbriteClient/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kurt Nelson"]
  gem.email         = ["kurtisnelson@gmail.com"]
  gem.description   = %q{Access the Eventbrite API}
  gem.summary       = %q{This is a less sucky Eventbrite gem that should actually work}
  gem.homepage      = "http://github.com/kurtisnelson/EventbriteClient"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "EventbriteClient"
  gem.require_paths = ["lib"]
  gem.version       = EventbriteClient::VERSION

  gem.add_dependency('rest-client', '>= 1.6.7')
  gem.add_dependency('json', '>= 1.7')
  gem.add_development_dependency('rake')
end
