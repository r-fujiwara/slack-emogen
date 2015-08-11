# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slack/emogen/version'

Gem::Specification.new do |spec|
  spec.name          = "slack-emogen"
  spec.version       = Slack::Emogen::VERSION
  spec.authors       = ["r-fujiwara"]
  spec.email         = ["fjwr0516@gmail.com"]

  spec.summary       = %q{generate slack emoji fastest}
  spec.description   = %q{let's create slack emoji}
  spec.homepage      = "https://github.com/r-fujiwara"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.licenses = ["MIT"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-byebug"
  spec.add_dependency "thor", ">= 0.1.91"
  spec.add_dependency "headless", "2.2.0"
  spec.add_dependency "selenium-webdriver", "~> 2.47.1"
  spec.add_dependency "mini_magick", "4.2.9"
end
