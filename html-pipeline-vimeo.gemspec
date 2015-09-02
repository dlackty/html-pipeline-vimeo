# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'html/pipeline/vimeo/version'

Gem::Specification.new do |spec|
  spec.name          = "html-pipeline-vimeo"
  spec.version       = HTML::Pipeline::Vimeo::VERSION
  spec.authors       = ["Richard Lee"]
  spec.email         = ["dlackty@gmail.com"]

  spec.summary       = %q{An HTML::Pipeline filter for Vimeo links}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/dlackty/html-pipeline-vimeo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'html-pipeline', "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
