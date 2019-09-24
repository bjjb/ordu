# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ordu/version'

Gem::Specification.new do |spec|
  spec.name          = 'ordu'
  spec.version       = Ordu::VERSION
  spec.authors       = ['JJ Buckley']
  spec.email         = ['jj@bjjb.org']

  spec.summary       = 'A command-line library'
  spec.description   = <<-DESC
  A Ruby library for for building command-line programs. Based on the builtin
  OptionParser. Includes a command-line program which builds stub command-line
  programs.
  DESC
  spec.homepage      = 'http://bjjb.github.io/ordu'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'pry', '~> 0.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.74'
end
