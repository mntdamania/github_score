# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github_score/version'

Gem::Specification.new do |spec|
  spec.name          = "github_score"
  spec.version       = GithubScore::VERSION
  spec.authors       = ["Manthan Damania"]
  spec.email         = ["mntdamania@gmail.com"]
  spec.summary       = %q{Calculates scores of github users based on opensource contributions}
  spec.homepage      = "https://github.com/mntdamania/github_score"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   << "github_score"
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 1.20"
  spec.add_development_dependency "jazz_hands"
end
