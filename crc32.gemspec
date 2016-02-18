# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crc32/version'

Gem::Specification.new do |spec|
  spec.name          = "crc32"
  spec.version       = Crc32::VERSION
  spec.authors       = ["szymonm"]
  spec.email         = ["miedziejko@gmail.com"]
  spec.summary       = "Ruby implementation of CRC32"
  spec.description   = "This is a challenge task. Just for fun with Ruby."
  spec.homepage      = "https://github.org/szymon33/crc32"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
