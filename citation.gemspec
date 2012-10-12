require 'rake'
Gem::Specification.new do |s|
  s.name        = 'citation'
  s.version     = '0.0.0'
  s.date        = '2012-10-12'
  s.summary     = "Tool to translate between bibliographic formats."
  s.description = "Leverages a Maven and a custom JAR and wraps it with JRuby"
  s.authors     = ["hab278"]
  s.email       = 'hab278@nyu.edu'
  s.files       = FileList['lib/*.rb', 'lib/*.jar', 'test/*.rb'].to_a
end
