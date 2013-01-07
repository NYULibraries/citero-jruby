# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "citero/version"

Gem::Specification.new do |s|
  s.name        = 'citero'
  s.version     = Citero::VERSION
  s.platform    = Gem::Platform::RUBY
  s.date        = '2012-10-12'
  s.summary     = "Tool to translate between bibliographic formats."
  s.description = "Leverages a Maven and a custom JAR and wraps it with JRuby"
  s.authors     = ["hab278"]
  s.email       = 'hab278@nyu.edu'
  s.files       = Dir["{app,lib,config}/**/*"] + ["Rakefile", "Gemfile", "README.md", "Jarfile"]
  s.add_dependency "rake", "0.9.2.2"
  s.add_dependency "test-unit"
  s.add_dependency "jbundler"
end