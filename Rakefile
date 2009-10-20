require 'rubygems'
gem 'rspec'
require 'rake'
require 'spec'
require 'spec/rake/spectask'

desc 'Default: run spec tests.'
task :default => :spec

desc "Run all specs"
Spec::Rake::SpecTask.new(:spec) do |task|
  task.spec_files = FileList['spec/to_nokogiri/**/*_spec.rb']
  task.spec_opts = ['--options', 'spec/spec.opts']
end
