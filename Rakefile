# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'
require 'cucumber/rake/task'
require 'rubocop/rake_task'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts == '--format pretty'
end

RuboCop::RakeTask.new(:style)

task default: %i[style test features]
