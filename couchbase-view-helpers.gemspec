# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'couchbase/view_helpers/version'

Gem::Specification.new do |spec|
  spec.name          = 'couchbase-view-helpers'
  spec.version       = Couchbase::ViewHelpers::VERSION
  spec.authors       = ['Mike Evans']
  spec.email         = ['mike@urlgonomics.com']
  spec.description   = %q{Adds syntactic sugar to Couchbase view options hashes.}
  spec.summary       = %q{Adds syntactic sugar to Couchbase view options hashes.}
  spec.homepage      = 'https://github.com/mje113/couchbase-view-helpers'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'couchbase',       '~> 1.3.3'
  spec.add_dependency 'couchbase-model', '~> 0.5.3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
