# -*- coding: utf-8 -*-

require 'rspec/core/rake_task'

namespace :spec do
  desc 'Run test for addition feature'
  RSpec::Core::RakeTask.new(:addition) do |spec|
    spec.pattern = FileList[ 'spec/features/addition_spec.rb' ]
  end

  desc 'Run test for subtraciton feature'
  RSpec::Core::RakeTask.new(:subtraction) do |spec|
    spec.pattern = FileList[ 'spec/features/subtraction_spec.rb']
  end
end

