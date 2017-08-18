# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name          = 'fluent-plugin-postgres'
  s.version       = '0.0.2'
  s.authors       = ['TAGOMORI Satoshi', 'Diogo Terror', 'pitr']
  s.email         = ['team@uken.com']
  s.description   = %q{fluent plugin to insert on PostgreSQL}
  s.summary       = %q{fluent plugin to insert on PostgreSQL}
  s.homepage      = 'https://github.com/uken/fluent-plugin-postgres'
  s.license       = 'Apache 2.0'

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_dependency 'fluentd', ['>= 0.14.15', '< 2']
  s.add_dependency 'pg'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'test-unit', '~> 3.2.0'
end
