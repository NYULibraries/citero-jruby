require 'rake/testtask'

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*.rb']
  t.verbose = true
end


desc "Run tests"
task :default => :test
