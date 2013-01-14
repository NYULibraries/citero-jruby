require 'rake/testtask'
require 'git'
require 'fileutils'

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = 'Citero-gem'
  rdoc.options << '--line-numbers'
  rdoc.options << '--markup markdown'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('app/**/*.rb')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*.rb']
  t.verbose = true
end

desc "Push latest rdoc and rdocs to gh-pages"
task :ghpages do
  g = Git.open(Dir.pwd)
  FileUtils.mv("coverage/", "coverage.bak/", :force => true)
  FileUtils.mv("doc/", "doc.bak/", :force => true)
  g.checkout(g.branch('gh-pages'))
  g.pull("origin", "gh-pages")
  FileUtils.rm_r("coverage", :force => true)
  FileUtils.mv("coverage.bak/", "coverage/", :force => true)
  FileUtils.rm_r("doc", :force => true)
  FileUtils.mv("doc.bak/", "doc/", :force => true)
  g.add(".")
  g.commit_all("Update coverage and rdocs.")
  g.push("origin", "gh-pages")
  FileUtils.cp_r("coverage/", "coverage.bak/")
  FileUtils.cp_r("doc/", "doc.bak/")
  g.checkout(g.branch('devel'))
  FileUtils.mv("coverage.bak/", "coverage/", :force => true)
  FileUtils.mv("doc.bak/", "doc/", :force => true)
end

desc "Run tests"
task :default => :test
