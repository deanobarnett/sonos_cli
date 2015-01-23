# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sonos_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "sonos_cli"
  spec.version       = SonosCli::VERSION
  spec.authors       = ["Dean Barnett"]
  spec.email         = ["dean@shopkeep.com"]
  spec.summary       = %q{Control sonos form cli}
  spec.description   = %q{Play songs on your sonos in the terminal}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', "~> 3.0.0"

  spec.add_dependency "thor", "~> 0.19.1"
  spec.add_dependency "sonos", "= 0.3.6"
  spec.add_dependency "awesome_print", "~> 1.6.1"
  spec.add_dependency "spotify-client", "~> 0.0.8"
end
