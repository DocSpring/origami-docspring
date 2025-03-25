# frozen_string_literal: true

# Optionally install bundler tasks if present.
begin
  require 'bundler'

  Bundler.setup
  Bundler::GemHelper.install_tasks
rescue LoadError
end

require 'rdoc/task'
require 'rake/testtask'
require 'rake/clean'

desc "Generate rdoc documentation"
Rake::RDocTask.new("rdoc") do |rdoc|
  rdoc.rdoc_dir = "doc"
  rdoc.title = "Origami"
  rdoc.options << "-U" << "-N"
  rdoc.options << "-m" << "Origami::PDF"

  rdoc.rdoc_files.include("lib/origami/**/*.rb")
end

desc "Run the test suite"
Rake::TestTask.new do |t|
  t.verbose = true
  t.libs << "test"
  t.test_files = ["test/test_pdf.rb"]
end

task :clean do
  Rake::Cleaner.cleanup_files Dir['*.gem', 'doc', 'examples/**/*.pdf']
end

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.options = ['--display-cop-names']
  end
rescue LoadError
  desc 'rubocop is not available in this environment'
  task :rubocop do
    abort 'Rubocop is not available in this environment'
  end
end

task default: :test
