# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name          = "fluent-plugin-postgres"
  gem.version       = "0.0.1"
  gem.authors       = ["TAGOMORI Satoshi", "Diogo Terror"]
  gem.email         = ["tagomoris@gmail.com", "diogo@uken.com"]
  gem.description   = %q{fluent plugin to insert on PostgreSQL}
  gem.summary       = %q{fluent plugin to insert on PostgreSQL}
  gem.homepage      = "https://github.com/uken/fluent-plugin-postgres"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "fluentd"
  gem.add_development_dependency "pg"
  gem.add_runtime_dependency "fluentd"
  gem.add_runtime_dependency "pg"
end
