#!/usr/bin/env rake
require 'rubygems'
require 'bundler'
require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rake'
require 'rspec/core'
require 'rspec/core/rake_task'

Bundler.setup

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec
