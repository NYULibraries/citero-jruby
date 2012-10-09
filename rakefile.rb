task :default => [:test]

task :test do
  ruby "CitationTest.rb"
end