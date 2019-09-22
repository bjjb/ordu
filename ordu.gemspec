# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ordu/version'

Gem::Specification.new do |spec|
  spec.name          = 'ordu'
  spec.version       = Ordu::VERSION
  spec.authors       = ['JJ Buckley']
  spec.email         = ['jj@bjjb.org']

  spec.summary       = 'A Ruby/Cloudflare CLI/API-client'
  spec.description   = <<-DESC
  A Ruby API library for managing your cloudflare domains and settings. Comes
  with a simple command-line tool. Also includes a little server and app,
  providing a slighly RESTier API and a simplified CloudFlare UI.
  DESC
  spec.homepage      = 'http://bjjb.github.io/ordu'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'cucumber', '~> 3.1.2'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.74'
end
