# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'advanced/version'

Gem::Specification.new do |spec|
  spec.name          = "advanced"
  spec.version       = Advanced::VERSION
  spec.authors       = ["Ray Zane"]
  spec.email         = ["ray@promptworks.com"]

  spec.summary       = %q{Search with objects!}
  spec.homepage      = "https://github.com/rzane/advanced"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.10"
end
