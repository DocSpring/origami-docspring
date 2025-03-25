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

# Release process tasks
namespace :version do
  desc 'Bump major version (X.0.0)'
  task :major do
    version_file = 'lib/origami/version.rb'
    content = File.read(version_file)
    new_content = content.gsub(/VERSION = ['"](\d+)\.(\d+)\.(\d+)['"]/) do
      major = $1.to_i + 1
      "VERSION = '#{major}.0.0'"
    end
    File.write(version_file, new_content)
    version = new_content.match(/VERSION = ['"](.+)['"]/)[1]
    puts "Bumped version to #{version}"
  end

  desc 'Bump minor version (0.X.0)'
  task :minor do
    version_file = 'lib/origami/version.rb'
    content = File.read(version_file)
    new_content = content.gsub(/VERSION = ['"](\d+)\.(\d+)\.(\d+)['"]/) do
      major = $1.to_i
      minor = $2.to_i + 1
      "VERSION = '#{major}.#{minor}.0'"
    end
    File.write(version_file, new_content)
    version = new_content.match(/VERSION = ['"](.+)['"]/)[1]
    puts "Bumped version to #{version}"
  end

  desc 'Bump patch version (0.0.X)'
  task :patch do
    version_file = 'lib/origami/version.rb'
    content = File.read(version_file)
    new_content = content.gsub(/VERSION = ['"](\d+)\.(\d+)\.(\d+)['"]/) do
      major = $1.to_i
      minor = $2.to_i
      patch = $3.to_i + 1
      "VERSION = '#{major}.#{minor}.#{patch}'"
    end
    File.write(version_file, new_content)
    version = new_content.match(/VERSION = ['"](.+)['"]/)[1]
    puts "Bumped version to #{version}"
  end
end

desc 'Release process: run tests, check for uncommitted changes, tag version, build and push to rubygems.org'
task :release_gem do
  puts "Running the test suite..."
  Rake::Task['test'].invoke

  puts "Running Rubocop..."
  Rake::Task['rubocop'].invoke

  puts "Checking for uncommitted changes..."
  status = `git status --porcelain`
  if !status.empty?
    puts "Error: There are uncommitted changes in the working directory."
    puts "Please commit or stash your changes before releasing."
    exit 1
  end

  # Get the current version
  require_relative 'lib/origami/version'
  version = Origami::VERSION

  puts "Preparing to release version #{version}..."
  puts "Building gem..."
  Rake::Task['build'].invoke

  puts "Creating git tag v#{version}..."
  system "git tag -s v#{version} -m 'Version #{version}'"

  puts "Pushing tag to origin..."
  system "git push origin v#{version}"

  puts "Pushing gem to RubyGems.org..."
  system "gem push pkg/origami-docspring-#{version}.gem"

  puts "Release complete! Version #{version} has been released."
end

task default: :test
