# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = "number_serialization".freeze
  s.version = "1.0.0.0"

  s.require_paths = ["lib"]
  s.authors = ["Nathan Ladd"]
  s.summary = "Number serialization for ruby"
  s.email = "nathanladd@gmail.com"
  s.homepage = "https://github.com/ntl/number-serialization"
  s.licenses = ["MIT"]
  s.required_ruby_version = ">= 2.4.0"

  s.add_runtime_dependency "evt-log"
  s.add_development_dependency "test_bench"
end
