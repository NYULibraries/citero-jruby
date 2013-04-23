# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "citero-jruby/version"

Gem::Specification.new do |s|
  s.name        = 'citero-jruby'
  s.version     = Citero::VERSION
  s.platform    = Gem::Platform::RUBY
  s.date        = '2013-04-23'
  s.summary     = "Tool to translate between bibliographic formats."
  s.description = "Leverages a Maven and a custom JAR and wraps it with JRuby"
  s.authors     = ["hab278"]
  s.email       = 'hab278@nyu.edu'
  s.homepage    = "https://github.com/NYULibraries/citero-jruby"
  
  s.files       = Dir["{app,lib,config}/**/*"] + ["Rakefile", "Gemfile", "README.md"]
  
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "test-unit", "~> 2.5"
  s.add_development_dependency "simplecov", "~> 0.7"
  s.add_development_dependency "simplecov-rcov", "~> 0.2"
  s.add_development_dependency "git", "~> 1.2"
  s.add_development_dependency "json", "~> 1.7"
  s.add_development_dependency "bundler", "~> 1.2"
  s.add_development_dependency "coveralls"
end
